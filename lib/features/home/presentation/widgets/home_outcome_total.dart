import 'package:flutter/material.dart';

class HomeOutcomeTotal extends StatelessWidget {
  const HomeOutcomeTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ 12,560.00',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
