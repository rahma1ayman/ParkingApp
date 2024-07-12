import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      required this.icon,
      this.onChanged,
      this.controller,
      this.onSubmitted});
  String? title;
  IconData icon;
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
      ),
    );
  }
}
