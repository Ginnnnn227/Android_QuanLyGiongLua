// ignore_for_file: non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/color.const.dart';

AwesomeDialog ConfirmDialog(
  //BuildContext ctx,
  String title,
  String desc,
  VoidCallback okPress,
  VoidCallback cancelPress
  
) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.question,
    animType: AnimType.topSlide,
    //showCloseIcon: true,
    title: title,
    desc: desc,
    btnOkText: 'CÓ',
    titleTextStyle: const TextStyle(fontSize: 20,color: kPrimaryColor,fontWeight: FontWeight.bold),
    btnCancelText: 'KHÔNG',
    descTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
    btnOkOnPress: okPress,
    btnCancelOnPress: cancelPress,

  );
}

AwesomeDialog successDialog(
  //BuildContext ctx,
  String title,
  String desc,
  VoidCallback okPress
  
) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.success,
    animType: AnimType.topSlide,
    //showCloseIcon: true,
    title: title,
    desc: desc,
    titleTextStyle: const TextStyle(fontSize: 20,color: kPrimaryColor,fontWeight: FontWeight.bold),
    btnOkText: 'Đóng',
    descTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
    btnOkOnPress: okPress,

  );
}
AwesomeDialog failDialog(
  //BuildContext ctx,
  String title,
  String desc,
  VoidCallback okPress
  
) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.error,
    animType: AnimType.topSlide,
    //showCloseIcon: true,
    title: title,
    desc: desc,
    titleTextStyle: const TextStyle(fontSize: 20,color: kPrimaryColor,fontWeight: FontWeight.bold),
    btnOkText: 'Đóng',
    descTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
    btnOkOnPress: okPress,
    btnOkColor: Colors.red
  );
}

AwesomeDialog warningDialog(
  //BuildContext ctx,
  String title,
  String desc,
  VoidCallback okPress
  
) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.warning,
    animType: AnimType.topSlide,
    //showCloseIcon: true,
    title: title,
    desc: desc,
    titleTextStyle: const TextStyle(fontSize: 20,color: kPrimaryColor,fontWeight: FontWeight.bold),
    btnOkText: 'Đóng',
    descTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
    btnOkOnPress: okPress,
    btnOkColor: Colors.amber
  );
}
