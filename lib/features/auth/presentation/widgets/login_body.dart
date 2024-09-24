import 'package:expense_tracker/core/common/widgets/app_button.dart';
import 'package:expense_tracker/core/common/widgets/app_logo.dart';
import 'package:expense_tracker/core/common/widgets/app_text_form_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/do_not_have_account_text.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            AppTextFormField(
              controller: emailController,
              hintText: 'Email',
            ),
            AppTextFormField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            const DoNotHaveAccountText(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            AppButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
