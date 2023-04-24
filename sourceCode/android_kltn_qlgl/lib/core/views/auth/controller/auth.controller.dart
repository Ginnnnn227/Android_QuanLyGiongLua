// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';
import 'package:qlgl_project/core/views/auth/login/login.view.dart';
import 'package:qlgl_project/core/views/home/home.view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../navbar/bottom_navbar.controller.dart';
import '../../../routes.dart';
import '../../widget/customDialog.wg.dart';
import '../model/login.model.dart';
import '../model/user_auth.model.dart';

class AuthController extends GetxController {

  BottomNavbarController controller = Get.find();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLogin = false;
  String access_token = '';
  //String? access_token;

  //Check duplicate value Email----------------------------------
  Future<bool> checkValueExistEmail(String value) async {
    // gọi API để lấy danh sách giá trị
    final response = await Dio().get(userURL);

    // kiểm tra nếu request thành công và có dữ liệu trả về
    if (response.statusCode == 200 && response.data != null) {
      // lặp qua danh sách giá trị và so sánh với giá trị cần tìm kiếm
      for (var data in response.data['data']) {
        if ((value
            .toLowerCase()
            .contains(data['email'].toString().toLowerCase()))) {
          // giá trị tồn tại trong API
          return true;
        }
      }
    }
    // giá trị không tồn tại trong API
    return false;
  }

  //LOGIN
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      warningDialog("", "Email và mật khẩu không được bỏ trống", () {}).show();
      return;
    }

    try {
      final response = await Dio()
          .post(login_authURL, data: {'email': email, 'password': password});

      final loginModel = LoginModel.fromJson(response.data);
      access_token = loginModel.accessToken;

      if (response.statusCode == 200) {
        //var data = json.decode(response.data['access_token']);
        // access_token.value = response.data['access_token'];
        // debugPrint(access_token.value);
        var token = GetStorage();
        token.write('token', response.data['access_token']);

        successDialog("Thành công", "Đăng nhập thành công", () {
          controller.changeTabIndex(0);
          AppPages.routes;
          Get.off(AppPages.getNavbar(),
              transition: Transition.fade, duration: Duration(seconds: 1));
        }).show();
        emailController.clear();
        passController.clear();
      }
    } catch (e) {
      failDialog("Thất bại", "Đăng nhập thất bại", () {}).show();
      print(e.toString());
    }
  }

  //logout

}
