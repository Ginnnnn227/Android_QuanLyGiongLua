import 'package:get/get.dart';

import 'controller/giong_list.controller.dart';

class GiongBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GiongListController>(GiongListController());
  }
}