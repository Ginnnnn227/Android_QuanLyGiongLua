import 'package:get/get.dart';

import '../controllers/dacdiemtinhtrang_list.controller.dart';
import '../controllers/doituongtinhtrang_list.controller.dart';
import '../controllers/giaidoantruongthanh_list.controller.dart';
import '../controllers/giong_list.controller.dart';
import '../controllers/kieuhinh_list.controller.dart';
import '../controllers/nhomgiong_list.controller.dart';
import '../navbar/bottom_navbar.controller.dart';
import '../views/profile/profile.controller.dart';


class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
    
    Get.lazyPut<NhomGiongListController>(() => NhomGiongListController());
    Get.lazyPut<KieuHinhListController>(() => KieuHinhListController());
    Get.lazyPut<GiongListController>(() => GiongListController());

    Get.lazyPut<GDTTListController>(() => GDTTListController());
    Get.lazyPut<DTTTListController>(() => DTTTListController());
    Get.lazyPut<DDTTListController>(() => DDTTListController());

    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}