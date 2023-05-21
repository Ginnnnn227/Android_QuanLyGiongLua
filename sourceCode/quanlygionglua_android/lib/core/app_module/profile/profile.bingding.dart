import 'package:get/get.dart';

import 'profile.controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}