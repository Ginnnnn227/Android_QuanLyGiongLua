import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/app_module/login/controller/AuthLogin.controller.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';

class HomeController extends GetxController {
  final getStorge = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    
  }
  @override
  void onReady() async {
    super.onReady();
  }
}
