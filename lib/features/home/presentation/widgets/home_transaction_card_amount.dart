import 'package:flutter/material.dart';

class HomeTransactionCardAmount extends StatelessWidget {
  final String type;
  final double amount;

  const HomeTransactionCardAmount({
    required this.type,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${type == 'income' ? '+' : '-'} \$${amount.toString()}',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: type == 'income' ? Colors.green : Colors.red,
          ),
    );
  }
}
