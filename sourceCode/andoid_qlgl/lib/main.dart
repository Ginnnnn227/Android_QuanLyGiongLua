import 'package:andoid_qlgl/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/colors.const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý giống lúa',
      theme: theme(),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
ThemeData theme() {
  return ThemeData(
    appBarTheme: appbarTheme(),
    primarySwatch: Colors.blue,
    fontFamily: "Muli",
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
  );
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appbarTheme() {
  return const AppBarTheme(
    // color: Colors.white,
    // elevation: 0,
    // //brightness: Brightness.light,
    // iconTheme: IconThemeData(color: Colors.black),
    // systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}

