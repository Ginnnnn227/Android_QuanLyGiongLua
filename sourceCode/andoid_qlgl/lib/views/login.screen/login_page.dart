import 'package:andoid_qlgl/views/login.screen/widgets/login_button.dart';
import 'package:andoid_qlgl/views/login.screen/widgets/social_card.dart';
import 'package:andoid_qlgl/views/login.screen/widgets/text_form.dart';
import 'package:andoid_qlgl/views/widgets/space.wg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/colors.const.dart';
import '../../controllers/bloc/loginAuth.bloc/auth_bloc.dart';
import '../widgets/loading.wg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginbuttonFocus;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginbuttonFocus = FocusNode();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginbuttonFocus.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // title: const Text(
          //   "ĐĂNG NHẬP",
          //   style: TextStyle(
          //       fontSize: 25, color: kPrimaryColor, fontWeight: FontWeight.bold),
          // ),
          // centerTitle: true,
          // iconTheme: IconThemeData(
          //   color: kPrimaryColor, //change your color here
          // ),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          //   onPressed: () =>
          //       Navigator.pop(context), //Navigator.of(context).pop(),
          // ),
          ),
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            buildErrorLayout();
          } else if (state is AuthLoaded) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  late bool remember = false;
  Widget buildInitialInput() => SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //HeightSpacer(myHeight: 40),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password \nor continue with another account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    HeightSpacer(myHeight: 40),
                    Form(
                      child: Column(
                        children: [
                          //user text field
                          InputTextField(
                            focusNode: usernameFocus,
                            textController: usernameController,
                            labeltext: "Email",
                            hinttext: "Enter your email",
                            icon: Icons.mail_outline,
                          ),
                          HeightSpacer(myHeight: 25),
                          //pass text field
                          InputTextField(
                            focusNode: passwordFocus,
                            textController: passwordController,
                            labeltext: "Password",
                            hinttext: "Enter your password",
                            icon: Icons.lock_outline,
                          ),
                          HeightSpacer(myHeight: 5),
                          Row(
                            children: [
                              Checkbox(
                                value: remember,
                                activeColor: kPrimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    remember = value!;
                                  });
                                },
                              ),
                              Text("Remember?"),
                              Spacer(),
                              Text(
                                "Forgot password",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                          HeightSpacer(myHeight: 20),
                          LoginButton(
                            focusNode: loginbuttonFocus,
                            userName: usernameController,
                            password: passwordController,
                          ),
                          HeightSpacer(myHeight: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialCard(
                                svgIcon: "assets/icons/google-icon.svg",
                                onpress: () {},
                              ),
                              SocialCard(
                                svgIcon: "assets/icons/facebook-2.svg",
                                onpress: () {},
                              ),
                            ],
                          ),
                          HeightSpacer(myHeight: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                          HeightSpacer(myHeight: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );
  clearTextData() {
    usernameController.clear();
    passwordController.clear();
  }
}
