import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/features/home/presentation/bloc/home_bloc.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_confirm_delete_transaction_dialog.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_content.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTransactionCard extends StatelessWidget {
  final String date;
  final List<Transaction> transactions;

  const HomeTransactionCard({
    required this.date,
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTransactionCardDate(date: date),
          const SizedBox(height: 8.0),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.redColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete_rounded,
                        color: AppColors.whiteColor,
                        size: 32,
                      ),
                    ],
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return HomeConfirmDeleteTransactionDialog(
                        title: transactions[index].title,
                      );
                    },
                  );
                },
                onDismissed: (direction) {
                  context.read<HomeBloc>().add(
                        HomeDeleteTransactionEvent(
                          id: transactions[index].id!,
                        ),
                      );
                  transactions.removeAt(index);
                },
                child: HomeTransactionCardContent(
                  title: transactions[index].title,
                  description: transactions[index].description,
                  amount: transactions[index].amount,
                  category: transactions[index].category,
                  type: transactions[index].type,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
