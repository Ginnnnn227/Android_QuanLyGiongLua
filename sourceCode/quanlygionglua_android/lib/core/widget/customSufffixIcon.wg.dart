import 'package:flutter/material.dart';

import '../constant/size.const.dart';

class CustomSufffixIcon extends StatelessWidget {
  const CustomSufffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(0),
        getProportionateScreenWidth(0),
        getProportionateScreenWidth(0),
        getProportionateScreenWidth(0),
      ),
      child: Icon(icon,color: Colors.grey.shade400,),
    );
  }
}