import 'package:expense_tracker/core/common/widgets/app_loading_indicator.dart';
import 'package:expense_tracker/core/utils/date_utils.dart';
import 'package:expense_tracker/core/utils/show_snackbar.dart';
import 'package:expense_tracker/features/home/presentation/bloc/home_bloc.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTransactionList extends StatefulWidget {
  const HomeTransactionList({
    super.key,
  });

  @override
  State<HomeTransactionList> createState() => _HomeTransactionListState();
}

class _HomeTransactionListState extends State<HomeTransactionList> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeFetchTransactionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
          final groupedTransactions =
              groupTransactionsByDate(state.transactions);
          final dates = groupedTransactions.keys.toList();
          return ListView.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final transactionsOnDate = groupedTransactions[date]!;
                return HomeTransactionCard(
                  date: date,
                  transactions: transactionsOnDate,
                );
              });
        }
        return const SizedBox();
      },
    );
  }
}
