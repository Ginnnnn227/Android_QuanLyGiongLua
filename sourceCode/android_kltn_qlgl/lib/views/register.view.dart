import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('ĐĂNG KÝ'),
      centerTitle: true,
      leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
    ));
  }
}
