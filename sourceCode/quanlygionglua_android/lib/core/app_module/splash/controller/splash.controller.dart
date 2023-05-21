
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/route.lib.dart';


class SplashController extends GetxController {
  final getStorge = GetStorage();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    //getStorge.remove('token');
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorge.read("token") != null) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAllNamed(Routes.BOTTOMNAVBAR);
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }

    // Future.delayed(const Duration(seconds: 5), () {
    //   Get.offAllNamed(Routes.HOME);
    // });
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
    
  }
}
