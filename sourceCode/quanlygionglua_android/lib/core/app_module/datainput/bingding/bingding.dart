import 'package:get/get.dart';

import '../../navbar/controller/bottom_navbar.controller.dart';
import '../controller/chitieungoaidong.controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<chitieungoaidongListController>(() => chitieungoaidongListController());
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
  }
}