import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/navbar/bottom_navbar.controller.dart';

import 'core/constant/color.const.dart';
import 'core/controllers/nhomgiong_list.controller.dart';
import 'core/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.light,
  //   systemStatusBarContrastEnforced: false,

  //   systemNavigationBarIconBrightness: Brightness.dark,
  //   systemNavigationBarColor: Colors.transparent,
  //   systemNavigationBarDividerColor: Colors.transparent,
  //   systemNavigationBarContrastEnforced: false,
  // );
  // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
  //     overlays: [SystemUiOverlay.bottom]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  Get.put(BottomNavbarController());
  Get.put(NhomGiongListController());

  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // ),);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      //Chạy trên máy ảo chrome
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          //iconTheme: IconThemeData(color: kPrimaryColor),
        ),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppPages.getLogin(),
      getPages: AppPages.routes,
    );
  }
}
