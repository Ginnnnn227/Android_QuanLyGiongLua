import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/controllers/login.controller.dart';

import 'body_login.dart';

class LoginView extends GetView<LoginController> {
  //const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage('assets/logo/background.jpg'),
            //   ),
            // ),
            child: BodyLogin()));
  }
}
