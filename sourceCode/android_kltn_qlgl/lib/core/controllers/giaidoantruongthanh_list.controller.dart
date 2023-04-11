import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apiurl.const.dart';
import '../constant/color.const.dart';
import '../models/giaidoantruongthanh.model.dart';

class GDTTListController extends GetxController {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  RxList<giaidoantruongthanhModel> data = RxList<giaidoantruongthanhModel>([]);
  RxString search = ''.obs;

  final TextEditingController gdttten_controller = TextEditingController();
  final TextEditingController gdttmota_controller = TextEditingController();

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

  //get
  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(giaidoantruongthanhURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
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
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // handle error
    }
    update();
  }

  //post
  Future<void> postData(giaidoantruongthanhModel data) async {
    try {
      final response =
          await Dio().post(giaidoantruongthanhURL, data: data.toJson());
      print(response.statusCode);
      if (response.statusCode == 201) {
        Get.snackbar('Thành công', 'Thêm thành công');
      } else {
        Get.snackbar('Lỗi', 'Thêm thất bại');
      }
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
    }
  }

  void submitProduct() async {
    final data = giaidoantruongthanhModel(
        gdttTen: gdttten_controller.text, gdttMota: gdttmota_controller.text);
    await postData(data);
    gdttten_controller.clear();
    gdttmota_controller.clear();
    
    fetchData();
  }

  //show dialog post
  void showCreateProductDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: const Text('THÊM GDTT'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textForm(
                  gdttten_controller, "Tên GDTT", "Tên giai đoạn trưởng thành"),
              textForm(
                  gdttmota_controller, "Mô tả", "Mô tả giai đoạn trưởng thành")
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
                if (gdttten_controller.text.isEmpty) {
                  Get.snackbar('Lỗi', 'Tên GDTT không được bỏ trống');
                }
                submitProduct();
                Get.back();
              },
              child: const Text('LƯU'),
            ),
          ],
        );
      },
    );
  }

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
      keyboardType: TextInputType.name,
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
  void onInit() {
    super.onInit();
    fetchData();
  }
}
