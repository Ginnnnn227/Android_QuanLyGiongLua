import 'package:get/get.dart';

import 'controller/loaisaubenh.controller.dart';

class LoaiSauBenhBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoaiSauBenhController>(LoaiSauBenhController());
  }
}