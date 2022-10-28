import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon
  }) : super(key: key);

  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyle.regular14.copyWith(color: MyColors.basicWhite),
        fillColor: const Color(0xFF262626),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: Colors.grey)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: Colors.grey)
        ),
      ),
    );
  }
}