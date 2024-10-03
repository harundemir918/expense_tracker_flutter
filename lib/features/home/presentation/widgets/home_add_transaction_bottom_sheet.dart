import 'package:expense_tracker/features/home/presentation/widgets/home_add_transaction_bottom_sheet_form.dart';
import 'package:flutter/material.dart';

class HomeAddTransactionBottomSheet extends StatelessWidget {
  const HomeAddTransactionBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.6,
      padding: const EdgeInsets.all(16.0),
      child: const HomeAddTransactionBottomSheetForm(),
    );
  }
}
