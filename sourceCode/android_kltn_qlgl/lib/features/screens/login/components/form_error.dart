import 'package:flutter/material.dart';

import '../../../../constants/size_configs.const.dart';

class ErrorForm extends StatelessWidget {
  const ErrorForm({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index]))
    );
  }

  Row formErrorText({required String error}) {
    return Row(
        children: [
          Icon(Icons.error, color: Colors.red,size: 18,),
          SizedBox(width: getProportionateScreenWidth(10),),
          Text(error,style: TextStyle(color: Colors.red),),
          //Text(errors[0]),
        ],
      );
  }
}