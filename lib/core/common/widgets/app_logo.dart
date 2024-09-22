import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'E X P E N S E',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
