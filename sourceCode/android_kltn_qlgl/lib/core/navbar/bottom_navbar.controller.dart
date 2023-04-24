// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/nhomgiong_list.controller.dart';


class BottomNavbarController extends GetxController {
  var tabIndex;
  @override
  void onInit(){
    super.onInit();
    //tabIndex = 0;
  }
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
  
}