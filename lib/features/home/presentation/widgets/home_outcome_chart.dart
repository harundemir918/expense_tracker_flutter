import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeOutcomeChart extends StatelessWidget {
  final List<double> chartData = [25, 30, 50, 45, 65, 40];

  HomeOutcomeChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(show: false),
          barGroups: chartData
              .map(
                (data) => BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: data,
                      width: 30,
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.lightPurpleColor3,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
