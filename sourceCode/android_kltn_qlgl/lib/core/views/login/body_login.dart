import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/routes.dart';

import '../../constant/color.const.dart';
import '../../constant/size.const.dart';
import '../widget/customBottomText.wg.dart';
import '../widget/customButton.wg.dart';
import '../widget/customTextFormField.wg.dart';
import 'component/social_card.wg.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30)),
                child: Column(
                  children: <Widget>[
                    //SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Text(
                    //   'HỆ THỐNG \nQUẢN LÝ GIỐNG LÚA',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.w700,
                    //       color: kPrimaryColor),
                    // ),
                    // SizedBox(height: getProportionateScreenHeight(10)),
                    Image(
                      image: const AssetImage('assets/logo/LogoAGU.png'),
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(80),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    const Text(
                      'Sử dụng email và mật khẩu \nđể đăng nhập hệ thống',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kSecondaryColor, fontSize: 18),
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    Form(
                      child: Column(
                        children: <Widget>[
                          //email input text
                          CustomTextFormField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'Nhập email',
                            pIcon: Icons.email_outlined,
                            keyType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getProportionateScreenHeight(25)),
                          //password input text
                          CustomTextFormField(
                            controller: passController,
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
                          style:
                              TextStyle(color: kSecondaryColor, fontSize: 16),
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
                      press: () {
                        AppPages.routes;
                        Get.to(AppPages.getNavbar(),transition: Transition.fade,duration: Duration(seconds: 1));
                        //Navigator.restorablePushNamed(context, home);
                      },
                      radius: 30,
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    const Text(
                      '- Hoặc -',
                      style: TextStyle(color: kSecondaryColor, fontSize: 20),
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
                    //text register
                    SizedBox(height: getProportionateScreenHeight(50)),
                    BottomText(
                      firsttext: 'Bạn chưa có tài khoản? ',
                      secondtext: 'Đăng ký',
                      ontap: () {
                        AppPages.routes;
                        Get.toNamed(AppPages.getRegister());
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


