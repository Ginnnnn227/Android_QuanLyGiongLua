import 'package:get/get.dart';

import 'controller/nhomgiong.controller.dart';


class NhomGiongBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NhomGiongController>(NhomGiongController());
  }
}