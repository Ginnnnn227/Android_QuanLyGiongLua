import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../constant/apiurl.const.dart';
import '../models/maptn.model.dart';

class MaPTNListController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<maptnModel> data = RxList<maptnModel>([]);
  RxString giongten = ''.obs;

  List<maptnModel> get filteredDataByGiongTen {
    if (giongten.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.giongTen!
              .toLowerCase()
              .contains(giongten.value.toLowerCase()))
          .toList();
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(maptnURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<maptnModel> sorted =
          responseData.map((post) => maptnModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.ptnCode!.compareTo(b.ptnCode!));
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
  void onInit() {
    super.onInit();
    fetchData();
  }
}