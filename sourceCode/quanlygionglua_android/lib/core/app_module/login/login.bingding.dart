import 'package:get/get.dart';

import 'controller/AuthLogin.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLoginController>(()=>AuthLoginController());
  }
}