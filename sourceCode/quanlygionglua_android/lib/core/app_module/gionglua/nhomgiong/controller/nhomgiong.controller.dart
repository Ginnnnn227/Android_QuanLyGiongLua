import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../constant/apiurl.const.dart';
import '../../../../models/nhomgiong.model.dart';

class NhomGiongController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<nhomgiongModel> data = RxList<nhomgiongModel>([]);
  RxString search = ''.obs;

  List<nhomgiongModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.nhomgiongTen!
              .toLowerCase()
              .contains(search.value.toLowerCase()))
          .toList();
    }
  }

  List<nhomgiongModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(nhomgiongURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<nhomgiongModel> sorted =
          responseData.map((post) => nhomgiongModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.nhomgiongTen!.compareTo(b.nhomgiongTen!));
      data.value = sorted;
      // final List<nhomgiongModel> list = [];

      // for (var item in responseData) {
      //   final model = nhomgiongModel.fromJson(item);
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
