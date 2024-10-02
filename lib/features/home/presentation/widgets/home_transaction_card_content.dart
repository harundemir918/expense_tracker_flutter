import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_amount.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_category.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_icon.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_title.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardContent extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String type;
  final double amount;

  const HomeTransactionCardContent({
    required this.title,
    required this.description,
    required this.category,
    required this.type,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const HomeTransactionCardIcon(),
          title: HomeTransactionCardTitle(title: title),
          subtitle: HomeTransactionCardCategory(category: category),
          trailing: HomeTransactionCardAmount(type: type, amount: amount),
        ),
      ],
    );
  }
}
