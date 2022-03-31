import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      hintText: hintText, //'john.doe@gmail.com',
      labelText: labelText, //'Email address',
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: Colors.deepPurple,
            ),
    );
  }
}
