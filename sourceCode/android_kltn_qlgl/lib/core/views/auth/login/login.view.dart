import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/views/auth/controller/auth.controller.dart';

import 'body_login.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  //const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        //appBar: AppBar(),
        body: BodyLogin());
  }
}
