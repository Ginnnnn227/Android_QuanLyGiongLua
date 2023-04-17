import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';

import '../models/giatritinhtrang.model.dart';

class GTTTListController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<giatritinhtrangModel> data = RxList<giatritinhtrangModel>([]);
  final RxString name = ''.obs;

  List<giatritinhtrangModel> get filteredData {
    if (name.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.ddttTen!
              .toLowerCase()
              .contains(name.value.toLowerCase()))
          .toList();
    }
  }

  List<giatritinhtrangModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(dacdiemtinhtrangURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<giatritinhtrangModel> sorted =
          responseData.map((post) => giatritinhtrangModel.fromJson(post)).toList();
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