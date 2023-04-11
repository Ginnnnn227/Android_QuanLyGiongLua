import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/models/giong.model.dart';

import '../constant/apiurl.const.dart';

class GiongListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<giongModel> data = RxList<giongModel>([]);
  RxString search = ''.obs;

  List<giongModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) =>
              item.giongTen!.toLowerCase().contains(search.value.toLowerCase()))
          .toList();
    }
  }

  List<giongModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(giongURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<giongModel> sorted =
          responseData.map((post) => giongModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.giongTen!.compareTo(b.giongTen!));
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
