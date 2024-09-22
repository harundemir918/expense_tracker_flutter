import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Hello,\n',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.whiteColor,
            ),
        children: const [
          TextSpan(
            text: 'Android',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
