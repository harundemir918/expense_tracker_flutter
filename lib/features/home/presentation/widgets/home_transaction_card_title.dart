import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardTitle extends StatelessWidget {
  final String title;

  const HomeTransactionCardTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
