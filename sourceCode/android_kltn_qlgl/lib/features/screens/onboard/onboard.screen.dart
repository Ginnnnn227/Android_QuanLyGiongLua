import 'package:android_kltn_qlgl/constants/size_configs.const.dart';
import 'package:android_kltn_qlgl/features/screens/onboard/components/body.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  //const OnBoardScreen({super.key});
  static String routename = "/onboard";

  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: BodyOnBoard());
  }
}