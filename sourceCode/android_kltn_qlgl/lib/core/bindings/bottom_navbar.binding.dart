import 'package:get/get.dart';

import '../controllers/nhomgiong_list.controller.dart';
import '../navbar/bottom_navbar.controller.dart';
import '../controllers/profile.controller.dart';


class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
    Get.lazyPut<NhomGiongListController>(() => NhomGiongListController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}