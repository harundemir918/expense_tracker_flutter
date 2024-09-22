import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        ),
      ),
      child: Text.rich(
        TextSpan(
          text: 'Don\'t have an account? ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.hintColor,
              ),
          children: [
            TextSpan(
              text: 'Sign up.',
              style: TextStyle(
                color: AppColors.lightPurpleColor3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
