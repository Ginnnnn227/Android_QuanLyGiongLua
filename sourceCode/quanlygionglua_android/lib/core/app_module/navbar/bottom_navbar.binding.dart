import 'package:get/get.dart';

import '../home/controller/home.controller.dart';
import '../profile/profile.controller.dart';
import 'controller/bottom_navbar.controller.dart';



class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}