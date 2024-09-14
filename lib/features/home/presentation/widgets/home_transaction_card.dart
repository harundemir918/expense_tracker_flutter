import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_content.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_date.dart';
import 'package:flutter/material.dart';

class HomeTransactionCard extends StatelessWidget {
  const HomeTransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTransactionCardDate(),
          SizedBox(height: 8.0),
          HomeTransactionCardContent(),
        ],
      ),
    );
  }
}
