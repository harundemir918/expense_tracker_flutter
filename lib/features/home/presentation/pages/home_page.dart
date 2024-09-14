import 'package:expense_tracker/features/home/presentation/widgets/home_outcome.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_top_section.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                HomeTopSection(),
                HomeOutcome(),
                Expanded(child: HomeTransactionList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
