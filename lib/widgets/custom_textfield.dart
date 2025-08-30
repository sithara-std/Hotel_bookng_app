import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textFieldName;
  final String? errorText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.textFieldName,
    this.errorText,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          labelText: textFieldName,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 2),
          )
        ), 
      ),
    );
  }
}