import 'package:flutter/material.dart';

class HomeTransactionCardAmount extends StatelessWidget {
  const HomeTransactionCardAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '- \$734.00',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.red,
          ),
    );
  }
}
