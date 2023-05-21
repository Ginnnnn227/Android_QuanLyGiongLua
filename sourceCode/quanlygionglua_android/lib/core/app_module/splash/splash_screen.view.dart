import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../constant/size.const.dart';
import 'controller/splash.controller.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight),
            child: Column(
              children: <Widget>[
                //top
                Expanded(flex: 1, child: Container()),
                //logo and title name
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/logo/LogoAGU.png',
                          width: SizeConfig.screenWidth / 5,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 40,
                        ),
                        Text(
                          'HỆ THỐNG QUẢN LÝ GIỐNG LÚA'.toUpperCase(),
                          style: TextStyle(
                              fontSize: SizeConfig.screenWidth / 20,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // lottie loading
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.white38],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //Lottie.asset('assets/loading1.json', width: width / 1.5,height: 100),
                        Lottie.asset('assets/loadingdot.json',
                            width: SizeConfig.screenWidth / 2),
                      ],
                    ),
                  ),
                ),
                //bottom
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
