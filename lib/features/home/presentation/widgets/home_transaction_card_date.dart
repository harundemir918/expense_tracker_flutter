import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/core/utils/date_utils.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardDate extends StatelessWidget {
  final String date;

  const HomeTransactionCardDate({
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDateForDisplay(DateTime.parse(date)),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.whiteColor,
          ),
    );
  }
}
