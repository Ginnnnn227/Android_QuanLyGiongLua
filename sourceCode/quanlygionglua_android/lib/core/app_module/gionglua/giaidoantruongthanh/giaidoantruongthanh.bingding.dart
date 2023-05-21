import 'package:get/get.dart';

import 'controller/giaidoantruongthanh.controller.dart';

class GiaiDoanTruongThanhBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GiaiDoanTruongThanhController>(GiaiDoanTruongThanhController());
  }
}