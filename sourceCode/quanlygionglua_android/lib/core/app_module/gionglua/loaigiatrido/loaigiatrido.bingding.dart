import 'package:get/get.dart';
import 'package:qlgl_project/core/app_module/gionglua/loaigiatrido/controller/loaigiatrido.controller.dart';

class LoaiGiaTriDoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoaiGiaTriDoController>(LoaiGiaTriDoController());
  }
}