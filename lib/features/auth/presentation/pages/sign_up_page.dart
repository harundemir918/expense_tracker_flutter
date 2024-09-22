import 'package:expense_tracker/core/common/widgets/app_button.dart';
import 'package:expense_tracker/core/common/widgets/app_logo.dart';
import 'package:expense_tracker/core/common/widgets/app_text_form_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/have_account_text.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              AppTextFormField(
                controller: nameController,
                hintText: 'Name',
              ),
              AppTextFormField(
                controller: emailController,
                hintText: 'Email',
              ),
              AppTextFormField(
                controller: passwordController,
                hintText: 'Password',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              const HaveAccountText(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              AppButton(
                text: 'Sign Up',
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
      ),
    );
  }
}
