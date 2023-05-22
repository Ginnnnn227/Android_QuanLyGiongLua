
import 'package:get/get.dart';

import 'controller/loaigiatrido.controller.dart';

class LoaiGiaTriDoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoaiGiaTriDoController>(LoaiGiaTriDoController());
  }
}