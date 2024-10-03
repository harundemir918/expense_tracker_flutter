import 'package:expense_tracker/features/home/presentation/widgets/home_add_button.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
      floatingActionButton: HomeAddButton(),
    );
  }
}
