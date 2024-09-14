import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card.dart';
import 'package:flutter/material.dart';

class HomeTransactionList extends StatelessWidget {
  const HomeTransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const HomeTransactionCard();
        });
  }
}
