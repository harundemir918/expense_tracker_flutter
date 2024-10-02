import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardDate extends StatelessWidget {
  final DateTime date;

  const HomeTransactionCardDate({
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      date.toString(),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
