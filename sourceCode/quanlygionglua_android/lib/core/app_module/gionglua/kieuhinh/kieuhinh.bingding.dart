import 'package:get/get.dart';

import 'controller/kieuhinh.controller.dart';

class KieuHinhBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KieuHinhController>(KieuHinhController());
  }
}