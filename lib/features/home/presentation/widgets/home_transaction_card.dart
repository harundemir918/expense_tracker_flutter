import 'package:expense_tracker/core/entities/transaction.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_content.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_date.dart';
import 'package:flutter/material.dart';

class HomeTransactionCard extends StatelessWidget {
  final Transaction transaction;

  const HomeTransactionCard({
    required this.transaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTransactionCardDate(date: transaction.date),
          const SizedBox(height: 8.0),
          HomeTransactionCardContent(
            title: transaction.title,
            description: transaction.description,
            amount: transaction.amount,
            category: transaction.category,
            type: transaction.type,
          ),
        ],
      ),
    );
  }
}
