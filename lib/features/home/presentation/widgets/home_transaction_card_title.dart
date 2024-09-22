import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardTitle extends StatelessWidget {
  const HomeTransactionCardTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Apple Store',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
