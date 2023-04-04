import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.const.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {super.key,
      required this.focusNode,
      required this.textController,
      required this.labeltext,
      required this.hinttext,
      required this.icon});

  final FocusNode focusNode;
  final TextEditingController textController;
  final String labeltext;
  final String hinttext;
  final IconData icon;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.labeltext == "Password" ? _obscure : false,
      controller: widget.textController,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        hintText: widget.hinttext,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: PrefixIcon(icon: widget.icon),
        suffixIcon: widget.labeltext == "Password"
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscure=!_obscure;
                  });
                },
                // ignore: dead_code
                child: Icon(_obscure? Icons.visibility:Icons.visibility_off),
              )
            : Text(""),
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
      ),
    );
  }
}

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        10,
        15,
        5,
        15,
      ),
      child: Icon(
        icon,
        size: 18,
      ),
      // child: SvgPicture.asset(
      //   svgIcon,
      //   height: getProportionateScreenHeight(15),
      // ),
    );
  }
}
