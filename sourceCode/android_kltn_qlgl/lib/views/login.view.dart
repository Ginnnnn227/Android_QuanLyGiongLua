import 'package:android_kltn_qlgl/utils/global.colors.dart';
import 'package:android_kltn_qlgl/views/register.view.dart';
import 'package:android_kltn_qlgl/widgets/button.global.dart';
import 'package:android_kltn_qlgl/widgets/textform.global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40.0),
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  // Text(
                  //   "Đăng nhập với tài khoản của bạn",
                  //   style: TextStyle(
                  //     color: GlobalColors.textColor,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  TextFormGlobal(
                    controller: usernameController,
                    hintText: "Tên đăng nhập",
                    obscure: false,
                  ),
                  const SizedBox(height: 20),
                  TextFormGlobal(
                    controller: passwordController,
                    hintText: "Mật khẩu",
                    obscure: true,
                  ),
                  const SizedBox(height: 30),
                  const ButtonGlobal(),
                  const SizedBox(height: 60),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '- Đăng nhập với -',
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              debugPrint("Đăng nhập với Facebook");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                "assets/logos/facebook.svg",
                                height: 35,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              debugPrint("Đăng nhập với Google");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                "assets/logos/google.svg",
                                height: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bạn chưa có tài khoản?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint('Đăng ký thành công');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                ' Đăng ký',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
