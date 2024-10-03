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
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: const HomeAddTransactionBottomSheetForm(),
    );
  }
}
