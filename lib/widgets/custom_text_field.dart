import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      required this.icon,
      this.onChanged,
      this.controller,
      this.onSubmitted,
      this.onPressed,
      this.prefixIcon,
      required this.isObscure});
  String? title;
  IconData icon;
  IconData? prefixIcon;
  VoidCallback? onPressed;
  bool isObscure;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'required';
        }
        return null;
      },
      controller: controller,
      obscureText: isObscure,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: title,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(primaryColor),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(secondaryColor),
          ),
        ),
        prefixIcon: Icon(icon),
        prefixIconColor: Color(secondaryColor),
        suffixIcon: IconButton(
          icon: Icon(prefixIcon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
