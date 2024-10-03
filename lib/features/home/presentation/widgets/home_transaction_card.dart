import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_content.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_date.dart';
import 'package:flutter/material.dart';

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
              return HomeTransactionCardContent(
                title: transactions[index].title,
                description: transactions[index].description,
                amount: transactions[index].amount,
                category: transactions[index].category,
                type: transactions[index].type,
              );
            },
          )
        ],
      ),
    );
  }
}
