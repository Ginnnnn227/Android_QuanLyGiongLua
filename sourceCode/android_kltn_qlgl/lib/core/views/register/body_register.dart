import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../constant/size.const.dart';
import '../../routes.dart';
import '../widget/customBottomText.wg.dart';
import '../widget/customButton.wg.dart';
import '../widget/customTextFormField.wg.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({super.key});

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpassController = TextEditingController();
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
                      image: AssetImage('assets/logo/LogoAGU.png'),
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(80),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    const Text(
                      'Đăng ký tài khoản mới',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kSecondaryColor, fontSize: 16),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Form(
                      child: Column(
                        children: <Widget>[
                          //name input text
                          CustomTextFormField(
                            Controller: nameController,
                            label: 'Họ và tên',
                            hint: 'Nhập họ và tên',
                            pIcon: Icons.abc_outlined,
                            keyType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getProportionateScreenHeight(25)),
                          //email input text
                          CustomTextFormField(
                            Controller: emailController,
                            label: 'Email',
                            hint: 'Nhập email',
                            pIcon: Icons.email_outlined,
                            keyType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getProportionateScreenHeight(25)),
                          //password input text
                          CustomTextFormField(
                            Controller: passController,
                            label: 'Mật khẩu',
                            hint: 'Nhập mật khẩu',
                            pIcon: Icons.key_outlined,
                            keyType: TextInputType.name,
                          ),
                          SizedBox(height: getProportionateScreenHeight(25)),
                          //password input text
                          CustomTextFormField(
                            Controller: confirmpassController,
                            label: 'Xác nhận mật khẩu',
                            hint: 'Nhập lại mật khẩu',
                            pIcon: Icons.key_outlined,
                            keyType: TextInputType.name,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    //forgotpassword
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            'Quên mật khẩu',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    // register button
                    CustomButton(
                      text: 'ĐĂNG KÝ',
                      press: () {},
                      radius: 30,
                    ),

                    //text register
                    SizedBox(height: getProportionateScreenHeight(50)),
                    BottomText(
                      firsttext: 'Bạn đã có tài khoản? ',
                      secondtext: 'Đăng nhập',
                      ontap: () {
                        AppPages.routes;
                        Get.toNamed(AppPages.getLogin());
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
