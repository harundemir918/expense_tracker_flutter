import 'package:expense_tracker/features/home/presentation/widgets/home_search_button.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_title.dart';
import 'package:flutter/material.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeTitle(),
        HomeSearchButton(),
      ],
    );
  }
}
