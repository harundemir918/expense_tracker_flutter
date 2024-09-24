import 'package:expense_tracker/features/home/presentation/widgets/home_outcome.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_top_section.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_transaction_list.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
