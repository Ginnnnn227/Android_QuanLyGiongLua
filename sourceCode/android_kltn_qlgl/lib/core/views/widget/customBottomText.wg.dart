import 'package:flutter/material.dart';

import '../../constant/color.const.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
    required this.firsttext,
    required this.secondtext,
    required this.ontap,
  }) : super(key: key);
  final String firsttext;
  final String secondtext;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(firsttext, style: TextStyle(color: kSecondaryColor, fontSize: 16)),
        GestureDetector(
          onTap: () => ontap(),
          child: Text(
            secondtext,
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}