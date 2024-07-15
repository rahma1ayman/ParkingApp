import 'package:flutter/material.dart';
import 'package:parking_app/helper/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 18),
      ),
      backgroundColor: Color(secondaryColor),
    ),
  );
}
