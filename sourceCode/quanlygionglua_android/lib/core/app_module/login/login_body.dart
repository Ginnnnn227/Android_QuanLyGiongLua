import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/app_module/login/controller/AuthLogin.controller.dart';

import '../../constant/color.const.dart';
import '../../constant/size.const.dart';
import '../../widget/customBottomText.wg.dart';
import '../../widget/customButton.wg.dart';
import '../../widget/customTextFormField.wg.dart';
import '../../widget/social_card.wg.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  
  bool remember = false;
  AuthLoginController controller = Get.find();
  final getStorge = GetStorage();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        bottom: false,
        top: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //top
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    //color: Colors.yellow,
                  ),
                ),
                // logo
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    //color: Colors.yellow,
                    child: Column(children: <Widget>[
                      Image(
                        image: const AssetImage('assets/logo/LogoAGU.png'),
                        fit: BoxFit.cover,
                        width: SizeConfig.screenWidth / 5,
                      ),
                    ]),
                  ),
                ),
                //title
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    //color: Colors.yellow,
                    child: Text(
                      'Sử dụng email và mật khẩu \nđể đăng nhập hệ thống',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: SizeConfig.screenWidth / 25),
                    ),
                  ),
                ),
                // login form
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      //color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          Form(
                            key: null,
                            child: Column(
                              children: <Widget>[
                                //email input text
                                CustomTextFormField(
                                  controller: controller.emailController,
                                  label: 'Email',
                                  hint: 'Nhập email',
                                  pIcon: Icons.email_outlined,
                                  keyType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                //password input text
                                CustomTextFormField(
                                  controller: controller.passwordController,
                                  label: 'Mật khẩu',
                                  hint: 'Nhập mật khẩu',
                                  pIcon: Icons.key_outlined,
                                  keyType: TextInputType.name,
                                ),
                              ],
                            ),
                          ),
                          //remember - forgotpassword
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: remember,
                                onChanged: (value) {
                                  setState(() {
                                    remember = value!;
                                  });
                                },
                              ),
                              const Text(
                                "Ghi nhớ",
                                style: TextStyle(
                                    color: kSecondaryColor, fontSize: 16),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(25)),
                          // login button
                          CustomButton(
                            text: 'ĐĂNG NHẬP',
                            press: () async{
                              controller.loginWithEmail();
                            },
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    //color: Colors.yellow,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          '- Hoặc -',
                          style:
                              TextStyle(color: kSecondaryColor, fontSize: 20),
                        ),
                        SizedBox(height: getProportionateScreenHeight(25)),
                        //social card
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocialCard(
                              icon: 'assets/logo/facebook-2.svg',
                              press: () {},
                            ),
                            SocialCard(
                              icon: 'assets/logo/google-icon.svg',
                              press: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //register
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    //color: Colors.red,
                    child: BottomText(
                      firsttext: 'Bạn chưa có tài khoản? ',
                      secondtext: 'Đăng ký',
                      ontap: () {
                        // AppPages.routes;
                        // Get.toNamed(AppPages.getRegister());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
