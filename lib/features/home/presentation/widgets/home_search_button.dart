import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: BorderSide(
          width: 1,
          color: AppColors.blackColor,
        ),
        shape: const CircleBorder(),
      ),
      child: const Icon(
        Icons.search,
      ),
    );
  }
}
