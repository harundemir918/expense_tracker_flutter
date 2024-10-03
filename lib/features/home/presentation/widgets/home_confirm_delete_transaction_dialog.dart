import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeConfirmDeleteTransactionDialog extends StatelessWidget {
  final String title;

  const HomeConfirmDeleteTransactionDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirm',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.whiteColor,
            ),
      ),
      backgroundColor: AppColors.darkPurpleColor2,
      content: Text(
        'Are you sure you want to delete $title?',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.whiteColor,
            ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.lightPurpleColor3,
                ),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text(
            'Delete',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.lightPurpleColor3,
                ),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
