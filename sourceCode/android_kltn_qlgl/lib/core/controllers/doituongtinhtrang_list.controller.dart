import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';
import 'package:qlgl_project/core/models/doituongtinhtrang.model.dart';
import 'package:qlgl_project/core/models/giaidoantruongthanh.model.dart';

import '../constant/color.const.dart';
import '../views/widget/customDialog.wg.dart';

class DTTTListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<doituongtinhtrangModel> data = RxList<doituongtinhtrangModel>([]);
  RxString search = ''.obs;
  var giaidoans = <giaidoantruongthanhModel>[].obs;
  RxString selectedGiaiDoan = 'all'.obs;

  RxInt selectedId = 0.obs;
  late int gdttid_controller = selectedId.value;
  final TextEditingController dtttten_controller = TextEditingController();
  final TextEditingController dtttmota_controller = TextEditingController();

  var dataById = doituongtinhtrangModel().obs;
  // final TextEditingController dtttten_update_controller =
  //     TextEditingController();
  // final TextEditingController dtttmota_update_controller =
  //     TextEditingController();

  // get filter data
  List<doituongtinhtrangModel> get filteredData {
    if (selectedGiaiDoan.value.toLowerCase() == "all") {
      if (search.value.isEmpty) {
        return data.toList();
      } else {
        return data
            .where((item) => item.dtttTen!
                .toLowerCase()
                .contains(search.value.toLowerCase()))
            .toList();
      }
    } else {
      if (search.value.isEmpty) {
        return data
            .where((item) => item.gdttTen!
                .toLowerCase()
                .contains(selectedGiaiDoan.value.toLowerCase()))
            .toList();
      } else {
        return data
            .where((item) =>
                item.gdttTen!
                    .toLowerCase()
                    .contains(selectedGiaiDoan.value.toLowerCase()) &&
                item.dtttTen!
                    .toLowerCase()
                    .contains(search.value.toLowerCase()))
            .toList();
      }
    }
  }

  // Get all list
  List<doituongtinhtrangModel> get allData {
    return data.toList();
  }

  //GET ALL
  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(doituongtinhtrangURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<doituongtinhtrangModel> sorted = responseData
          .map((post) => doituongtinhtrangModel.fromJson(post))
          .toList();
      sorted.sort((a, b) => a.gdttTen!.compareTo(b.gdttTen!));
      data.value = sorted;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
    update();
  }

  //GET by ID-------------------------------------
  Future<void> fetchDataById(int id) async {
    try {
      var response = await Dio().get('$doituongtinhtrangURL/$id');
      dataById.value = doituongtinhtrangModel.fromJson(response.data['data']);
    } catch (e) {
      print(e);
    }
  }

  //GET dropdown giai doan truong thanh
  void loadDropdown() async {
    try {
      var response = await Dio().get(giaidoantruongthanhURL);
      var data = response.data['data'] as List;
      giaidoans.value =
          data.map((item) => giaidoantruongthanhModel.fromJson(item)).toList();
      update();
    } catch (e) {
      print(e);
    }
  }

  //GET ID giai đoạn
  Future<void> loadIdGDTT(String name) async {
    try {
      var response = await Dio().get(giaidoantruongthanhURL);
      var data = response.data['data'] as List;
      var list = data.where((item) =>
          item['giaidoantt_ten'].toLowerCase().contains(name.toLowerCase()));
      dynamic getid = list.elementAt(0)['id'];
      selectedId.value = getid;
      update();
    } catch (e) {
      print(e);
    }
  }

  //POST
  Future<void> postData(Map<String, dynamic> data) async {
    try {
      final response = await Dio().post(doituongtinhtrangURL, data: data);
      if (response.statusCode == 201) {
        successDialog("Thành công", "Đã thêm thành công".toUpperCase(), () {})
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
  Future<void> putData(int id, Map<String, dynamic> data) async {
    try {
      final response = await Dio().put("$doituongtinhtrangURL/$id", data: data);
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

  // DELETE
  Future<void> deleteData(int id) async {
    try {
      final response = await Dio().delete("$doituongtinhtrangURL/$id");

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

//-------------------------------------------------------------
//Check duplicate value create
  Future<bool> checkValueExistCreate(String value) async {
    // gọi API để lấy danh sách giá trị
    final response = await Dio().get(doituongtinhtrangURL);

    // kiểm tra nếu request thành công và có dữ liệu trả về
    if (response.statusCode == 200 && response.data != null) {
      // lặp qua danh sách giá trị và so sánh với giá trị cần tìm kiếm
      for (var data in response.data['data']) {
        if ((value
            .toLowerCase()
            .contains(data['doituongtt_ten'].toString().toLowerCase()))) {
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
    final response = await Dio().get(doituongtinhtrangURL);

    // kiểm tra nếu request thành công và có dữ liệu trả về
    if (response.statusCode == 200 && response.data != null) {
      // lặp qua danh sách giá trị và so sánh với giá trị cần tìm kiếm
      for (var data in response.data['data']) {
        if (id != data['id']) {
          if ((value
              .toLowerCase()
              .contains(data['doituongtt_ten'].toString().toLowerCase()))) {
            // giá trị tồn tại trong API
            return true;
          }
        }
      }
    }
    // giá trị không tồn tại trong API
    return false;
  }

  // submit Create
  void submitCreate() async {
    Map<String, dynamic> data = {
      'doituongtt_ten': dtttten_controller.text,
      'doituongtt_mota': dtttmota_controller.text,
      'giaidoantruongthanh_id': gdttid_controller,
    };
    final valueExists = await checkValueExistCreate(dtttten_controller.text);
    if (valueExists) {
      warningDialog("", "Tên GDTT đã tồn tại", () {}).show();
      //return;
    } else if (selectedId == 0) {
      warningDialog("", "Chưa chọn giai đoạn trưởng thành", () {}).show();
    } else {
      await postData(data);
    }
    // selectedId = 0.obs;
    // dtttten_controller.clear();
    // dtttmota_controller.clear();
    fetchData();
  }

  //submit update
  void submitUpdate(int id) async {
    Map<String, dynamic> data = {
      'giaidoantruongthanh_id': selectedId.value,
      'doituongtt_ten': dtttten_controller.text,
      'doituongtt_mota': dtttmota_controller.text,
    };
    final valueExists =
        await checkValueExistUpdate(id, dtttten_controller.text);
    if (valueExists) {
      warningDialog("", "Tên GDTT đã tồn tại", () {}).show();
      //return;
    } else if (selectedId == 0) {
      warningDialog("", "Chưa chọn giai đoạn trưởng thành", () {}).show();
    } else {
      await putData(id, data);
    }

    fetchData();
  }

  // submit delete
  void submitDelete(int id) async {
    await deleteData(id);
    await fetchData();
  }

//Dialog------------------------------------------------
//show dialog post
  void showCreateDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        selectedId = 0.obs;
        dtttmota_controller.clear();
        dtttten_controller.clear();
        return AlertDialog(
          title: const Text('Thêm đối tượng tính trạng'),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: DropdownButtonFormField<int>(
                    iconSize: 25,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.cyan,
                    ),
                    dropdownColor: Colors.cyan.shade50,
                    decoration: const InputDecoration(
                      labelText: "Giai đoạn trưởng thành * ",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                    value: selectedId.value,
                    items: [
                      DropdownMenuItem<int>(
                        //alignment: AlignmentDirectional.centerStart,
                        value: 0,
                        child: Text(
                          '--Chọn giai đoạn--'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ...giaidoans.value.map(
                        (item) => DropdownMenuItem(
                          value: item.id,
                          child: Text(
                            item.gdttTen!.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      selectedId.value = value!;
                      gdttid_controller = selectedId.value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              textForm(
                  dtttten_controller, "Tên DTTT *", "Tên đối tượng tính trạng"),
              SizedBox(
                height: 10,
              ),
              textForm(
                  dtttmota_controller, "Mô tả", "Mô tả đối tượng tính trạng")
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedId = 0.obs;
                dtttten_controller.clear();
                dtttmota_controller.clear();
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

//show dialog put
  void showUpdateDialog(int id) async {
    await fetchDataById(id);
    await loadIdGDTT(dataById.value.gdttTen!);
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Obx(() {
          dtttten_controller.text = dataById.value.dtttTen!;
          dataById.value.dtttMota == null
              ? dtttmota_controller.text = ""
              : dtttmota_controller.text = dataById.value.dtttMota!;
          return AlertDialog(
            title: const Text('CẬP NHẬT ĐỐI TƯỢNG TÍNH TRẠNG'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
                fontSize: 20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Obx(
                  () => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: DropdownButtonFormField<int>(
                      iconSize: 25,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.cyan,
                      ),
                      dropdownColor: Colors.cyan.shade50,
                      decoration: const InputDecoration(
                        labelText: "Giai đoạn trưởng thành * ",
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                      value: selectedId.value,
                      items: [
                        DropdownMenuItem<int>(
                          //alignment: AlignmentDirectional.centerStart,
                          value: 0,
                          child: Text(
                            '--Chọn giai đoạn--'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.cyan,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ...giaidoans.value.map(
                          (item) => DropdownMenuItem(
                            value: item.id,
                            child: Text(
                              item.gdttTen!.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        selectedId.value = value!;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                textForm(dtttten_controller, "Tên DTTT *",
                    "Tên đối tượng tính trạng"),
                SizedBox(
                  height: 10,
                ),
                textForm(dtttmota_controller, "Mô tả",
                    "Mô tả đối tượng tính trạng"),
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

//widget-------------------------------------------------------
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
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: cl),
      gapPadding: 10,
    );
  }

//--------------------------------------------------------------
  @override
  void onInit() async {
    super.onInit();
    await fetchData();
    loadDropdown();
  }
}
