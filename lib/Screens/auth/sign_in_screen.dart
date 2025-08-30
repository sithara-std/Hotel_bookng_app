import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
          SizedBox(
            height: 20,
          ),

          CustomTextField(
            textFieldName: "E-mail",
          ),
          CustomTextField(
            textFieldName: "Password",
          ),
          
          CustomButton(
            btnText: "SignIn",
          )
        ],
      );
  }
}

