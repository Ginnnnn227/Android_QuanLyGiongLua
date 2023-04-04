import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/controllers/register.controller.dart';

import '../../constant/color.const.dart';
import 'body_register.dart';

class RegisterView extends GetView<RegisterController> {

//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: BodyRegister()
    );
  }
}
