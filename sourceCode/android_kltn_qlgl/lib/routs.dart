

import 'package:android_kltn_qlgl/features/screens/login/signin.screen.dart';
import 'package:android_kltn_qlgl/features/screens/onboard/onboard.screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardScreen.routename: (context) => OnBoardScreen(),
  LoginPage.routename: (context) => LoginPage(),
};