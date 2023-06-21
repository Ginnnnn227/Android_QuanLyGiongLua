import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../../../../constant/apiurl.const.dart';
import '../../../../models/loaisaubenh.model.dart';
import '../../../../widget/customDialog.wg.dart';

class LoaiSauBenhController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;
  //RxList<Map<String, dynamic>> filteredList = <Map<String, dynamic>>[].obs;
  RxString search = ''.obs;
  TextEditingController tencontroller = TextEditingController();
  TextEditingController motacontroller = TextEditingController();
  TextEditingController donvicontroller = TextEditingController();
  File? imageFile;

  //GET
  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(loaisaubenhURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> resdata = response.data['data'];

      data.assignAll(resdata.map((item) => item as Map<String, dynamic>));
      data = data..sort((a, b) => b['updated_at'].compareTo(a['updated_at']));
      //filterList();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // handle error
    }
    update();
  }

  List<Map<String, dynamic>> get filteredList {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item['loaisaubenh_ten']
              .toString()
              .toLowerCase()
              .contains(search.value.toLowerCase()))
          .toList();
    }
  }
  //POST
  Future<void> postLoaiSauBenh(loaisaubenhModel model) async {
    try {
      if (model.loaisaubenhHinhAnh == null) {
        print('Vui lòng chọn hình ảnh');
        return;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(loaisaubenhURL),
      );

      request.fields['loaisaubenh_ten'] = model.loaisaubenhTen!;
      request.fields['loaisaubenh_mota'] = model.loaisaubenhMoTa!;
      request.fields['loaisaubenh_donvi'] = model.loaisaubenhDonVi!;
      request.files.add(await http.MultipartFile.fromPath(
        'loaisaubenh_hinhanh',
        model.loaisaubenhHinhAnh!.path,
      ));

      var response = await request.send();

      if (response.statusCode == 201) {
        print('Product posted successfully');
        // TODO: Handle success scenario
      } else {
        print('Failed to post product');
        // TODO: Handle failure scenario
      }
    } catch (error) {
      print('Error posting product: $error');
      // TODO: Handle error scenario
    }
  }
  //DELETE
  Future<void> deleteData(int id) async {
    try {
      final response = await Dio().delete("$loaisaubenhURL/$id");

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
  void submitDelete(int id) async {
    await deleteData(id);
    await fetchData();
  }
  // void filterList() {
  //   if (search.value.isEmpty) {
  //     filteredList.assignAll(data.toList());
  //   } else {
  //     final filteredData = data.where((item) =>
  //         item['loaisaubenh_ten'].toString().toLowerCase().contains(search.value.toLowerCase()));
  //     filteredList.assignAll(filteredData);
  //   }
  // }

  @override
  void onInit() async {
    await EasyLoading.show(status: 'Loading...');
    super.onInit();
    await fetchData();
    search.value = '';
    EasyLoading.dismiss();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
