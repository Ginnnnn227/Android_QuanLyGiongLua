// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:http/http.dart';


class BottomNavbarController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}