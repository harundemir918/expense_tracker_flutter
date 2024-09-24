import 'package:expense_tracker/core/common/widgets/app_logo.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
