import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_chart.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_title.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_total.dart';
import 'package:flutter/material.dart';

class HomeOutcome extends StatelessWidget {
  const HomeOutcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeOutcomeTitle(),
          HomeOutcomeTotal(),
          HomeOutcomeChart(),
        ],
      ),
    );
  }
}
