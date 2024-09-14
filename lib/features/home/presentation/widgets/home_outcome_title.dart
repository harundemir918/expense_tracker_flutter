import 'package:flutter/material.dart';

class HomeOutcomeTitle extends StatelessWidget {
  const HomeOutcomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Outcome',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
    );
  }
}
