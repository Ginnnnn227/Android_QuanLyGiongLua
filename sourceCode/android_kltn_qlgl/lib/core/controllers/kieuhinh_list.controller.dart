import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../constant/apiurl.const.dart';
import '../models/kieuhinh.model.dart';

class KieuHinhListController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<kieuhinhModel> data = RxList<kieuhinhModel>([]);
  RxString search = ''.obs;

  List<kieuhinhModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.kieuhinhTen!
              .toLowerCase()
              .contains(search.value.toLowerCase()))
          .toList();
    }
  }

  List<kieuhinhModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(kieuhinhURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<kieuhinhModel> sorted =
          responseData.map((post) => kieuhinhModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.kieuhinhTen!.compareTo(b.kieuhinhTen!));
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