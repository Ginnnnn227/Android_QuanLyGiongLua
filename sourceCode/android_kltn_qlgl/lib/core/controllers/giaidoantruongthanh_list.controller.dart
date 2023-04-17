import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apiurl.const.dart';
import '../constant/color.const.dart';
import '../models/giaidoantruongthanh.model.dart';
import '../views/widget/customDialog.wg.dart';

class GDTTListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<giaidoantruongthanhModel> data = RxList<giaidoantruongthanhModel>([]);
  var dataById = giaidoantruongthanhModel().obs;
  RxString search = ''.obs;

  final TextEditingController gdttten_controller = TextEditingController();
  final TextEditingController gdttmota_controller = TextEditingController();
  // final TextEditingController gdttten_update_controller =
  //     TextEditingController();
  // final TextEditingController gdttmota_update_controller =
  //     TextEditingController();

  List<giaidoantruongthanhModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) =>
              item.gdttTen!.toLowerCase().contains(search.value.toLowerCase()))
          .toList();
    }
  }

  List<giaidoantruongthanhModel> get allData {
    return data.toList();
  }

  //GET-----------------------------
  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(giaidoantruongthanhURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        final List<giaidoantruongthanhModel> sorted = responseData
            .map((post) => giaidoantruongthanhModel.fromJson(post))
            .toList();
        sorted.sort((a, b) => a.gdttTen!.compareTo(b.gdttTen!));
        data.value = sorted;
        // final List<giaidoantruongthanhModel> list = [];

        // for (var item in responseData) {
        //   final model = giaidoantruongthanhModel.fromJson(item);
        //   list.add(model);
        // }

        // data.value = list;
        isLoading(false);
      } else {
        debugPrint('Error: ${response.data}');
      }
    } catch (e) {
      isLoading(false);
      // handle error
    }
    update();
  }

  //GET by ID-------------------------------------
  Future<void> fetchDataById(int id) async {
    try {
      var response = await Dio().get('$giaidoantruongthanhURL/$id');
      dataById.value = giaidoantruongthanhModel.fromJson(response.data['data']);
    } catch (e) {
      print(e);
    }
  }

  //Check duplicate value create----------------------------------
  Future<bool> checkValueExistCreate(String value) async {
    // gọi API để lấy danh sách giá trị
    final response = await Dio().get(giaidoantruongthanhURL);

    // kiểm tra nếu request thành công và có dữ liệu trả về
    if (response.statusCode == 200 && response.data != null) {
      // lặp qua danh sách giá trị và so sánh với giá trị cần tìm kiếm
      for (var data in response.data['data']) {
        if ((value
            .toLowerCase()
            .contains(data['giaidoantt_ten'].toString().toLowerCase()))) {
          // giá trị tồn tại trong API
          return true;
        }
      }
    }
    // giá trị không tồn tại trong API
    return false;
  }

  //Check duplicate value update----------------------------------
  Future<bool> checkValueExistUpdate(int id, String value) async {
    // gọi API để lấy danh sách giá trị
    final response = await Dio().get(giaidoantruongthanhURL);

    // kiểm tra nếu request thành công và có dữ liệu trả về
    if (response.statusCode == 200 && response.data != null) {
      // lặp qua danh sách giá trị và so sánh với giá trị cần tìm kiếm
      for (var data in response.data['data']) {
        if (id != data['id']) {
          if ((value
              .toLowerCase()
              .contains(data['giaidoantt_ten'].toString().toLowerCase()))) {
            // giá trị tồn tại trong API
            return true;
          }
        }
      }
    }
    // giá trị không tồn tại trong API
    return false;
  }

  //POST-------------------------------------
  Future<void> postData(giaidoantruongthanhModel data) async {
    try {
      final response =
          await Dio().post(giaidoantruongthanhURL, data: data.toJson());
      if (response.statusCode == 201) {
        successDialog("Đã thêm thành công",
                "GDTT: ${data.gdttTen}".toUpperCase(), () {})
            .show();
        //Get.snackbar('Thành công', 'Thêm thành công');
      } else if (response.statusCode == 200) {
        warningDialog("", "Trường có dấu * không được bỏ trống", () {}).show();
        //Get.snackbar('Thành công', 'Thêm thành công');
      } else {
        failDialog("Thất bại", "Không thể thêm", () {}).show();
        //Get.snackbar('Lỗi', 'Thêm thất bại');
      }
    } catch (e) {
      failDialog("Thất bại", "Không thể thêm", () {}).show();
      //Get.snackbar('Lỗi', e.toString());
      debugPrint(e.toString());
    }
  }

  //PUT---------------------------------
  Future<void> putData(int id, giaidoantruongthanhModel data) async {
    try {
      final response =
          await Dio().put("$giaidoantruongthanhURL/$id", data: data.toJson());
      if (response.statusCode == 201) {
        successDialog("Thành công", "Đã cập nhật thành công", () {}).show();
      } else if (response.statusCode == 200) {
        warningDialog("", "Trường có dấu * không được bỏ trống", () {}).show();
      } else {
        failDialog("Thất bại", "Không thể cập nhật", () {}).show();
        //Get.snackbar('Lỗi', 'Thêm thất bại');
      }
    } catch (e) {
      failDialog("Thất bại", "Không thể cập nhật", () {}).show();
      //Get.snackbar('Lỗi', e.toString());
      debugPrint(e.toString());
    }
  }

  // DELETE-----------------------------
  Future<void> deleteData(int id) async {
    try {
      final response = await Dio().delete("$giaidoantruongthanhURL/$id");

      if (response.statusCode == 200) {
        successDialog("Đã xóa thành công", "".toUpperCase(), () {}).show();
      } else {
        failDialog("Thất bại", "Không thể xóa", () {}).show();
      }
    } catch (e) {
      failDialog("Thất bại", "Không thể xóa", () {}).show();
      //Get.snackbar('Lỗi', e.toString());
      debugPrint(e.toString());
    }
  }

//---------------------------------------------------------------------------------------------------
  void submitCreate() async {
    final data = giaidoantruongthanhModel(
        gdttTen: gdttten_controller.text, gdttMota: gdttmota_controller.text);
    final valueExists = await checkValueExistCreate(gdttten_controller.text);
    if (valueExists) {
      warningDialog("", "Tên GDTT đã tồn tại", () {}).show();
      //return;
    } else {
      await postData(data);
    }
    // gdttten_controller.clear();
    // gdttmota_controller.clear();
    fetchData();
  }

  void submitUpdate(int id) async {
    final data = giaidoantruongthanhModel(
        gdttTen: gdttten_controller.text,
        gdttMota: gdttmota_controller.text);
    final valueExists =
        await checkValueExistUpdate(id, gdttten_controller.text);
    if (valueExists) {
      warningDialog("", "Tên GDTT đã tồn tại", () {}).show();
      //return;
    } else {
      await putData(id, data);
    }
    
    fetchData();
  }

  void submitDelete(int id) async {
    await deleteData(id);
    await fetchData();
  }

  //show dialog post
  void showCreateProductDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        gdttten_controller.clear();
        gdttmota_controller.clear();
        return AlertDialog(
          title: const Text('THÊM GDTT'),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              textForm(gdttten_controller, "Tên GDTT *",
                  "Tên giai đoạn trưởng thành"),
              SizedBox(
                height: 10,
              ),
              textForm(
                  gdttmota_controller, "Mô tả", "Mô tả giai đoạn trưởng thành")
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                gdttten_controller.clear();
                gdttmota_controller.clear();
                Get.back();
              },
              child: const Text('HỦY'),
            ),
            ElevatedButton(
              onPressed: () async {
                submitCreate();
                Get.back();
              },
              child: const Text('LƯU'),
            ),
          ],
        );
      },
    );
  }

  void showUpdateProductDialog(int id) async {
    await fetchDataById(id);

    showDialog(
      context: Get.context!,
      builder: (context) {
        return Obx(() {
          gdttten_controller.text = dataById.value.gdttTen!;
          dataById.value.gdttMota == null
              ? gdttmota_controller.text = ""
              : gdttmota_controller.text = dataById.value.gdttMota!;
          return AlertDialog(
            title: const Text('CẬP NHẬT GDTT'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
                fontSize: 20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                height: 10,
              ),
              textForm(
                 gdttten_controller, "Tên GDTT *", "Tên giai đoạn trưởng thành"),
              SizedBox(
                height: 10,
              ),
              textForm(
                  gdttmota_controller, "Mô tả", "Mô tả giai đoạn trưởng thành"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('HỦY'),
              ),
              ElevatedButton(
                onPressed: () async {
                  //function update
                  submitUpdate(id);
                  Get.back();
                },
                child: const Text('LƯU'),
              ),
            ],
          );
        });
      },
    );
  }

  //show dialog delete
  // void showConfirmDeleteDialog(String text) {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('XÁC NHẬN'),
  //         titleTextStyle: TextStyle(fontWeight: FontWeight.w600,color: kPrimaryColor,fontSize: 20),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             Text("Bạn có chắc chắn muốn xóa?"),
  //             SizedBox(height: 10,),
  //             Text(text,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 16),)
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: const Text('Không'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               Get.back();
  //             },
  //             child: const Text('CÓ'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget textForm(
    TextEditingController controller,
    String label,
    String hint,
  ) {
    return TextFormField(
      validator: label == "Tên GDTT"
          ? (value) {
              if (value!.isEmpty) {
                return "Tên giai đoạn bắt buộc nhập";
              }
              return null;
            }
          : (value) {},
      controller: controller,
      //keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        floatingLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: outlineInputBorder(kTextColor01),
        focusedBorder: outlineInputBorder(Colors.blue),
        border: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color cl) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: cl),
      gapPadding: 10,
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
  }
}
