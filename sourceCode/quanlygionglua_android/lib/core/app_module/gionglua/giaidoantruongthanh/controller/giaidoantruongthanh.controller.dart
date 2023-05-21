import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';

import '../../../../models/giaidoantruongthanh.model.dart';

class GiaiDoanTruongThanhController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<giaidoantruongthanhModel> data = RxList<giaidoantruongthanhModel>([]);
  RxString search = ''.obs;

  List<giaidoantruongthanhModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.gdttMota!
              .toLowerCase()
              .contains(search.value.toLowerCase()))
          .toList();
    }
  }

  List<giaidoantruongthanhModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(giaidoantruongthanhURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<giaidoantruongthanhModel> sorted =
          responseData.map((post) => giaidoantruongthanhModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.gdttTen!.compareTo(b.gdttTen!));
      data.value = sorted;
      // final List<kieuhinhModel> list = [];

      // for (var item in responseData) {
      //   final model = kieuhinhModel.fromJson(item);
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

  @override
  void onInit() async{
    super.onInit();
    await fetchData();
    search.value = '';
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