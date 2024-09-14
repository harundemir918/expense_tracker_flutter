import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_amount.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_category.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_icon.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_card_title.dart';
import 'package:flutter/material.dart';

class HomeTransactionCardContent extends StatelessWidget {
  const HomeTransactionCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: HomeTransactionCardIcon(),
          title: HomeTransactionCardTitle(),
          subtitle: HomeTransactionCardCategory(),
          trailing: HomeTransactionCardAmount(),
        ),
      ],
    );
  }
}
