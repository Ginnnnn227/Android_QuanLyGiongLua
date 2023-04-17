import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/models/giong.model.dart';

import '../constant/apiurl.const.dart';
import '../models/nhomgiong.model.dart';

class GiongListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<giongModel> data = RxList<giongModel>([]);
  RxString search = ''.obs;
  var nhomgiongs = <nhomgiongModel>[].obs;
  RxString selectedNG = 'all'.obs;

  List<giongModel> get filteredData {
    if (selectedNG.value.toLowerCase() == 'all') {
      if (search.value.isEmpty) {
        return data.toList();
      } else {
        return data
            .where((item) => item.giongTen!
                .toLowerCase()
                .contains(search.value.toLowerCase()))
            .toList();
      }
    } else {
      if (search.value.isEmpty) {
        return data
            .where((item) => item.nhomgiongTen!
                .toLowerCase()
                .contains(selectedNG.value.toLowerCase()))
            .toList();
      } else {
        return data
            .where((item) =>
                item.nhomgiongTen!
                    .toLowerCase()
                    .contains(selectedNG.value.toLowerCase()) &&
                item.giongTen!
                    .toLowerCase()
                    .contains(search.value.toLowerCase()))
            .toList();
      }
    }
  }

  List<giongModel> get allData {
    return data.toList();
  }
  //GET
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

  //dropdown nhomgiong

  void loadDropdown() async {
    try {
      var response = await Dio().get(nhomgiongURL);
      var data = response.data['data'] as List;
      nhomgiongs.value =
          data.map((item) => nhomgiongModel.fromJson(item)).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
    loadDropdown();
  }
}
