import 'package:get/get.dart';
import 'package:qlgl_project/core/app_module/splash/controller/splash.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
