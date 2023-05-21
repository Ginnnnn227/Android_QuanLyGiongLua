import 'package:flutter/material.dart';

import '../constant/color.const.dart';
import '../constant/size.const.dart';

class CustomPrefixIcon extends StatelessWidget {
  const CustomPrefixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(5),
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(5),
        getProportionateScreenWidth(10),
      ),
      child: Icon(icon,color: kPrimaryColor,),
    );
  }
}