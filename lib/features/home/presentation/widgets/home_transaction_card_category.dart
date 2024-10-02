import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardCategory extends StatelessWidget {
  final String category;

  const HomeTransactionCardCategory({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.hintColor,
          ),
    );
  }
}
