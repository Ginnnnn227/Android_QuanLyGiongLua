import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:qlgl_project/core/constant/apiurl.const.dart';

import '../../../routes/route.lib.dart';
import '../../../widget/customDialog.wg.dart';

class AuthLoginController extends GetxController {
  //BottomNavbarController controller = Get.find();
  final getStorge = GetStorage();
  Timer? _timer;
  var isLogin = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //logic function-------------------------------------------------
  //login
  Future<void> loginWithEmail() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      warningDialog("", "Email và mật khẩu không được bỏ trống", () {}).show();
      return;
    }
    
    try {
      final response = await Dio().post(login_authURL, data: {
        'email': emailController.text,
        'password': passwordController.text
      });

      // final loginModel = LoginModel.fromJson(response.data);
      // access_token = loginModel.accessToken;

      if (response.statusCode == 200) {
        getStorge.write("token", response.data['access_token']);
        if (getStorge.read('token') != null) {
          getUserProfileData(getStorge.read('token'));
        }
        Get.snackbar('Success', 'Đăng nhập thành công',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        //loading
        await EasyLoading.show(status: 'Loading...');
        await Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(Routes.BOTTOMNAVBAR);
        });
        // controller.changeTabIndex(0);
        // AppPages.routes;
        // Get.off(AppPages.getNavbar(),
        //     transition: Transition.fade, duration: Duration(seconds: 1));
        // successDialog("Thành công", "Đăng nhập thành công", () {
        //   controller.changeTabIndex(0);
        //   AppPages.routes;
        //   Get.off(AppPages.getNavbar(),
        //       transition: Transition.fade, duration: Duration(seconds: 1));
        // }).show();
        emailController.clear();
        passwordController.clear();
      }
    } catch (e) {
      await EasyLoading.show(status: 'Loading...');
      Get.snackbar('Fail', 'Đăng nhập thất bại',
          icon: Icon(
            Icons.error_outline,
            size: 30,
            color: Colors.red,
          ),
          shouldIconPulse: true,
          margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      //failDialog("Thất bại", "Đăng nhập thất bại", () {}).show();
      print(e.toString());
    }
    EasyLoading.dismiss();
  }

  // getuser by token
  Future<void> getUserProfileData(String accesstoken) async {
    try {
      final response = await Dio().get(
        user_authURL,
        //queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${accesstoken}',
          },
        ),
      );
      getStorge.write('username', response.data['name']);
      getStorge.write('email', response.data['email']);
      getStorge.write('userid', response.data['id']);
      getStorge.write('useraddress', response.data['address']);
      getStorge.write('userphone', response.data['phone']);
      // print(getStorge.read('username'));
      // print(getStorge.read('email'));
      print(response.data);
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  // logout
  Future<void> logOut(String accesstoken) async {
    try {
      final response = await Dio().delete(
        logout_authURL,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${accesstoken}',
          },
        ),
      );
      if (response.statusCode == 200) {
        getStorge.remove('userid');
        getStorge.remove('token');
        // getStorge.remove('username');
        // getStorge.remove('email');
        await Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(Routes.LOGIN);
        });
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  //event state----------------------------------------------------
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
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

  // void initAuth()async{
  //   navigateToRegister();
  // }
  // void navigateToRegister() {
  //   Get.offAllNamed("/register");
  // }

}
