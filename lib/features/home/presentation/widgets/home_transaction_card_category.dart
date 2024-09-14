import 'package:flutter/material.dart';

class HomeTransactionCardCategory extends StatelessWidget {
  const HomeTransactionCardCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Electronics',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black38,
          ),
    );
  }
}
