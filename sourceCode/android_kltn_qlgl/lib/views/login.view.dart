import 'package:android_kltn_qlgl/utils/global.colors.dart';
import 'package:android_kltn_qlgl/widgets/textform.global.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Logo",
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Đăng nhập với tài khoản của bạn",
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormGlobal(controller: usernameController, hintText: "Tên đăng nhập",obscure: false,),
                const SizedBox(height: 20),
                TextFormGlobal(controller: passwordController, hintText: "Mật khẩu",obscure: true,),
                TextFormField(obscureText: true,decoration: InputDecoration(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
