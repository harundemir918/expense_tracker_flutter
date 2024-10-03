import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/features/home/presentation/widgets/home_add_transaction_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeAddButton extends StatefulWidget {
  const HomeAddButton({
    super.key,
  });

  @override
  State<HomeAddButton> createState() => _HomeAddButtonState();
}

class _HomeAddButtonState extends State<HomeAddButton> {
  void _showAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkPurpleColor2,
      isScrollControlled: true,
      builder: (context) {
        return const HomeAddTransactionBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showAddBottomSheet(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPurpleColor3,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Icon(
        Icons.add_rounded,
        size: 30,
        color: AppColors.lightPurpleColor2,
      ),
    );
  }
}
