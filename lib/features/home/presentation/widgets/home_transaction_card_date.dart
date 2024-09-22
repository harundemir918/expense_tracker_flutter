import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardDate extends StatelessWidget {
  const HomeTransactionCardDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Today',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
