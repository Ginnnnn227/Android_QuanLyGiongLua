import 'package:android_kltn_qlgl/constants/colors.const.dart';
import 'package:android_kltn_qlgl/features/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});
  static String routename = "/log_in";

  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   "ĐĂNG NHẬP",
        //   style: TextStyle(
        //       fontSize: 25, color: kPrimaryColor, fontWeight: FontWeight.bold),
        // ),
        // centerTitle: true,
        // iconTheme: IconThemeData(
        //   color: kPrimaryColor, //change your color here
        // ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () =>
              Navigator.pop(context), //Navigator.of(context).pop(),
        ),
      ),
      body: BodyLogin(),
    );
  }
}
