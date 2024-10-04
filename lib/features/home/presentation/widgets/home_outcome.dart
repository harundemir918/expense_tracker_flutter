import 'package:expense_tracker/core/common/widgets/app_loading_indicator.dart';
import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/core/utils/calculate_transaction_chart.dart';
import 'package:expense_tracker/core/utils/show_snackbar.dart';
import 'package:expense_tracker/features/home/presentation/bloc/home_bloc.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_chart.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_title.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_outcome_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOutcome extends StatelessWidget {
  const HomeOutcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.35,
      margin: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.purpleColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const AppLoadingIndicator();
          }
          if (state is HomeSuccess) {
            final calculatedData =
                calculateTransactionChart(state.transactions);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeOutcomeTitle(),
                HomeOutcomeTotal(total: calculatedData['total']!),
                HomeOutcomeChart(),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
