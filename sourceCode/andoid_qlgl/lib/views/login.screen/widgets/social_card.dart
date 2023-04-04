import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.svgIcon,
    required this.onpress,
  }) : super(key: key);

  final String svgIcon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onpress,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5),blurRadius: 3)]
        ),
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}