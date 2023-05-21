// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/apiurl.const.dart';
import '../../../../models/loaigiatrido.model.dart';

class LoaiGiaTriDoController extends GetxController with SingleGetTickerProviderMixin{
  RxBool isLoading = true.obs;
  RxList<loaigiatridoModel> data = RxList<loaigiatridoModel>([]);
  RxString search = ''.obs;
  RxString phanloai = ''.obs;
  late TabController tabcontroller;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Ngoài đồng'.toUpperCase(),),
    Tab(text: 'Trong nhà'.toUpperCase(),)
  ];


  // List<loaigiatridoModel> get filteredData {
  //   if (search.value.isEmpty) {
  //     return data.toList();
  //   } else {
  //     return data
  //         .where((item) => item.loaigiatridoTen!
  //             .toLowerCase()
  //             .contains(search.value.toLowerCase()))
  //         .toList();
  //   }
  // }
  List<loaigiatridoModel> get filteredData {
    if (search.value.isEmpty) {
      return data.toList();
    } else {
      return data
          .where((item) => item.loaigiatridoTen!
              .toLowerCase()
              .contains(phanloai.value.toLowerCase()))
          .toList();
    }
  }

  List<loaigiatridoModel> get allData {
    return data.toList();
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio()
          .get(loaigiatridoURL)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connect time out try again");
      });
      final List<dynamic> responseData = response.data['data'];
      final List<loaigiatridoModel> sorted =
          responseData.map((post) => loaigiatridoModel.fromJson(post)).toList();
      sorted.sort((a, b) => a.loaigiatridoTen!.compareTo(b.loaigiatridoTen!));
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
    tabcontroller = TabController(length: 2, vsync: this);
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
    tabcontroller.dispose();
    super.onClose();
  }
}