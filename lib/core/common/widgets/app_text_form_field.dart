import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: AppColors.whiteColor),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.lightPurpleColor2,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.hintColor),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return '$hintText is missing';
          }
          return null;
        },
      ),
    );
  }
}
