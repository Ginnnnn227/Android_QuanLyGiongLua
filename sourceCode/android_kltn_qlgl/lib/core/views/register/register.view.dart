import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/views/register/register.controller.dart';

import 'body_register.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});


//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(),
      body: BodyRegister()
    );
  }
}
