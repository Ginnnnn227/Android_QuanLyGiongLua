import 'package:get/get.dart';
import 'package:qlgl_project/core/app_module/home/controller/home.controller.dart';

import '../login/controller/AuthLogin.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthLoginController>(() => AuthLoginController());
  }
}