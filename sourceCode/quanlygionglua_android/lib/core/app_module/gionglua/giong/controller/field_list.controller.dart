import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../constant/apiurl.const.dart';
import '../../../../models/mangoaidong.model.dart';

class MaFIELDListController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<mangoaidongModel> data = RxList<mangoaidongModel>([]);
  RxString giongten = ''.obs;

  List<mangoaidongModel> get filteredDataByGiongTen {
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
          .get(mangoaidongURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<mangoaidongModel> sorted =
          responseData.map((post) => mangoaidongModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.fieldCode!.compareTo(b.fieldCode!));
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