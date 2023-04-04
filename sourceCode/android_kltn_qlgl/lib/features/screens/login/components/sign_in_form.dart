import 'package:flutter/material.dart';

import '../../../../constants/colors.const.dart';
import '../../../../constants/other.const.dart';
import '../../../../constants/size_configs.const.dart';
import 'form_error.dart';

class SigninTextForm extends StatefulWidget {
  const SigninTextForm({super.key});

  @override
  State<SigninTextForm> createState() => _SigninTextFormState();
}

class _SigninTextFormState extends State<SigninTextForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  late bool remember=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //email text form
          buildEmailForm(),
          SizedBox(height: getProportionateScreenHeight(25)),
          //password text form
          buildPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(5)),
          //checkbox remember
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember?"),
              Spacer(),
              Text("Forgot password", style: TextStyle(color:kPrimaryColor,decoration: TextDecoration.underline),)
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          //error form text
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          //Sign in button
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(55),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
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
                    fontSize: getProportionateScreenWidth(20),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordForm() {
    return TextFormField()
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 6 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 6 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        hintText: "Enter your password",
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: PrefixIcon(icon: Icons.lock_outline),
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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

  TextFormField buildEmailForm() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        hintText: "Enter your email",
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: PrefixIcon(icon: Icons.mail_outline),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(15),
        getProportionateScreenWidth(5),
        getProportionateScreenWidth(15),
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
