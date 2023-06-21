import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';

import '../../../models/giong.model.dart';
import '../../../widget/customDialog.wg.dart';
import '../models/chitieungoaidong.model.dart';

class chitieungoaidongListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<chitieungoaidongModel> data = RxList<chitieungoaidongModel>([]);
  RxString search = ''.obs;
  var giongs = <giongModel>[].obs;
  RxString selectedGiong = 'all'.obs;
  RxInt selectedId = 0.obs;

  late int giongid_controller = selectedId.value;
  final TextEditingController phienla_controller = TextEditingController();
  final TextEditingController taila_controller = TextEditingController();
  final TextEditingController gocnhanh_controller = TextEditingController();
  final TextEditingController bela_controller = TextEditingController();
  final TextEditingController gocla_controller = TextEditingController();
  final TextEditingController msgocla_controller = TextEditingController();
  final TextEditingController gocladong_controller = TextEditingController();
  final TextEditingController thoatcb_controller = TextEditingController();
  final TextEditingController msgocthan_controller = TextEditingController();
  final TextEditingController dangbong_controller = TextEditingController();
  final TextEditingController congtrucbong_controller = TextEditingController();
  final TextEditingController rau_controller = TextEditingController();

  // get filter data
  List<chitieungoaidongModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) =>
              item.giongTen!.toLowerCase().contains(search.value.toLowerCase()))
          .toList();
    }
  }

  // Get all list
  List<chitieungoaidongModel> get allData {
    return data.toList();
  }

  //GET ALL
  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(chitieungoaidongURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<chitieungoaidongModel> sorted = responseData
          .map((post) => chitieungoaidongModel.fromJson(post))
          .toList();
      sorted.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
      data.value = sorted;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
    update();
  }

//POST
  Future<void> postData(Map<String, dynamic> data) async {
    try {
      final response = await Dio().post(chitieungoaidongURL, data: data);
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
      final response = await Dio().put("$chitieungoaidongURL/$id", data: data);
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
      final response = await Dio().delete("$chitieungoaidongURL/$id");

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

  //GET dropdown giống
  void loadDropdown() async {
    try {
      var response = await Dio().get(giongURL);
      var data = response.data['data'] as List;
      giongs.value = data.map((item) => giongModel.fromJson(item)).toList();
      update();
    } catch (e) {
      print(e);
    }
  }
  //GET ID giai đoạn
  Future<void> loadIdGiong(String name) async {
    try {
      var response = await Dio().get(giongURL);
      var data = response.data['data'] as List;
      var list = data.where((item) =>
          item['giong_ten'].toLowerCase().contains(name.toLowerCase()));
      dynamic getid = list.elementAt(0)['id'];
      selectedId.value = getid;
      update();
    } catch (e) {
      print(e);
    }
  }

//---------------------------------------------------------------------------------------------------
  void submitCreate() async {
    Map<String, dynamic> data = {
      "chitieungoaidong_phienla": phienla_controller.text,
      "chitieungoaidong_taila": taila_controller.text,
      "chitieungoaidong_gocnhanh": gocnhanh_controller.text,
      "chitieungoaidong_bela": bela_controller.text,
      "chitieungoaidong_gocla": gocla_controller.text,
      "chitieungoaidong_msgocla": msgocla_controller.text,
      "chitieungoaidong_gocladong": gocladong_controller.text,
      "chitieungoaidong_thoatcb": thoatcb_controller.text,
      "chitieungoaidong_msgocthan": msgocthan_controller.text,
      "chitieungoaidong_dangbong": dangbong_controller.text,
      "chitieungoaidong_congtrucbong": congtrucbong_controller.text,
      "chitieungoaidong_rau": rau_controller.text,
      "giong_id": giongid_controller,
    };

    await postData(data);
    
    fetchData();
  }
  void makeNull(){
    selectedId=0.obs;
    phienla_controller.clear();
    taila_controller.clear();
    gocnhanh_controller.clear();
    bela_controller.clear();
    gocla_controller.clear();
    msgocla_controller.clear();
    gocladong_controller.clear();
    thoatcb_controller.clear();
    msgocthan_controller.clear();
    dangbong_controller.clear();
    dangbong_controller.clear();
    congtrucbong_controller.clear();
    rau_controller.clear;
  }

  void submitUpdate(int id) async {
    Map<String, dynamic> data = {
      "chitieungoaidong_phienla": phienla_controller.text,
      "chitieungoaidong_taila": taila_controller.text,
      "chitieungoaidong_gocnhanh": gocnhanh_controller.text,
      "chitieungoaidong_bela": bela_controller.text,
      "chitieungoaidong_gocla": gocla_controller.text,
      "chitieungoaidong_msgocla": msgocla_controller.text,
      "chitieungoaidong_gocladong": gocladong_controller.text,
      "chitieungoaidong_thoatcb": thoatcb_controller.text,
      "chitieungoaidong_msgocthan": msgocthan_controller.text,
      "chitieungoaidong_dangbong": dangbong_controller.text,
      "chitieungoaidong_congtrucbong": congtrucbong_controller.text,
      "chitieungoaidong_rau": rau_controller.text,
      "giong_id": selectedId.value,
    };
      await putData(id, data);

    fetchData();
  }

  void submitDelete(int id) async {
    await deleteData(id);
    await fetchData();
  }

  //--------------------------------------------------------------
  @override
  void onInit() async {
    super.onInit();
    await fetchData();
  }
}
