import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeOutcomeTotal extends StatelessWidget {
  final double total;

  const HomeOutcomeTotal({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '\$ ',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: total.toString(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
