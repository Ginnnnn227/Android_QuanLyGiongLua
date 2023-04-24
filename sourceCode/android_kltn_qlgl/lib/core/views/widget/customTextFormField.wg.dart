import 'package:flutter/material.dart';

import '../../constant/color.const.dart';
import 'customPrefixIcon.wg.dart';
import 'customSufffixIcon.wg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.pIcon,
    required this.keyType,
    required this.controller,
  }) : super(key: key);
  final String label;
  final String hint;
  final IconData? pIcon;
  final TextInputType? keyType;
  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText:
          (widget.label == 'Mật khẩu' || widget.label == 'Xác nhận mật khẩu')
              ? _obscure
              : false,
      keyboardType: widget.keyType,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
        floatingLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        contentPadding: EdgeInsets.symmetric(
            horizontal: (widget.label == 'Mật khẩu' ||
                    widget.label == 'Xác nhận mật khẩu')
                ? 0
                : 25),
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        prefixIcon: CustomPrefixIcon(
          icon: widget.pIcon!,
        ),
        suffixIcon:
            (widget.label == 'Mật khẩu' || widget.label == 'Xác nhận mật khẩu')
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: _obscure
                        ? const CustomSufffixIcon(icon: Icons.visibility)
                        : const CustomSufffixIcon(icon: Icons.visibility_off),
                  )
                : null,
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: outlineInputBorder(kTextColor01),
        focusedBorder: outlineInputBorder(Colors.blue),
        border: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color cl) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: cl),
      gapPadding: 10,
    );
  }
}
