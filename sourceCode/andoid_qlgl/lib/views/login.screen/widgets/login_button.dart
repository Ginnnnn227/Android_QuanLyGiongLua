import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/colors.const.dart';
import '../../../controllers/bloc/loginAuth.bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key, required this.focusNode, required this.userName, required this.password,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController userName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          //   _formKey.currentState!.save();
          // }
          BlocProvider.of<AuthBloc>(context)
              .add(Login(userName.text, password.text));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(kPrimaryColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),
        child: Text(
          'SIGN IN',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
