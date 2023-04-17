import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';

import '../models/dacdiemtinhtrang.model.dart';

class DDTTListController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<dacdiemtinhtrangModel> data = RxList<dacdiemtinhtrangModel>([]);

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(dacdiemtinhtrangURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<dacdiemtinhtrangModel> sorted =
          responseData.map((post) => dacdiemtinhtrangModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.ddttTen!.compareTo(b.ddttTen!));
      data.value = sorted;
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
  }
}