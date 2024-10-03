import 'package:expense_tracker/core/common/widgets/app_button.dart';
import 'package:expense_tracker/core/common/widgets/app_text_form_field.dart';
import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAddTransactionBottomSheetForm extends StatefulWidget {
  const HomeAddTransactionBottomSheetForm({super.key});

  @override
  State<HomeAddTransactionBottomSheetForm> createState() =>
      _HomeAddTransactionBottomSheetFormState();
}

class _HomeAddTransactionBottomSheetFormState
    extends State<HomeAddTransactionBottomSheetForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add new transaction',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  side: BorderSide(
                    width: 1,
                    color: AppColors.lightPurpleColor2,
                  ),
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: AppColors.whiteColor,
                  size: 32,
                ),
              ),
            ],
          ),
          AppTextFormField(
            controller: _titleController,
            hintText: 'Title',
          ),
          AppTextFormField(
            controller: _descriptionController,
            hintText: 'Description',
          ),
          AppTextFormField(
            controller: _typeController,
            hintText: 'Type',
          ),
          AppTextFormField(
            controller: _amountController,
            hintText: 'Amount',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10.0),
          AppButton(text: 'Add', onPressed: () {}),
        ],
      ),
    );
  }
}
