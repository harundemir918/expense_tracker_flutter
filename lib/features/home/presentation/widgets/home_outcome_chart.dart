import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeOutcomeChart extends StatelessWidget {
  const HomeOutcomeChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chart',
      style: TextStyle(
        color: AppColors.whiteColor,
      ),
    );
  }
}
