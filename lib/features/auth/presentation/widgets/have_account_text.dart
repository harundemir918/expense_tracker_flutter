import 'package:expense_tracker/core/theme/app_colors.dart';
import 'package:expense_tracker/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
      child: Text.rich(
        TextSpan(
          text: 'Already have an account? ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.hintColor,
              ),
          children: [
            TextSpan(
              text: 'Log in.',
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
