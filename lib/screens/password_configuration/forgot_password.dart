import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/screens/password_configuration/verification.dart';
import 'package:drivox/widgets/button.dart';
import 'package:drivox/widgets/clickable_text.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  static String routeName = '/forgotPassword';
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrivoxLogo(text: 3),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: emailController,
              cursorColor: AppColors.textFormField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter an Email';
                } else if (!RegExp(r'^[\w.-]+@[\w.-]+\.\w+$').hasMatch(value)) {
                  return "Please Enter a Valid Email";
                }
                return null;
              },
              onChanged: (value) {
                emailController.value = TextEditingValue(
                  text: value.toLowerCase(),
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: AppColors.textFormField),
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: AppColors.error),
                hintText: 'Email',
                hintStyle: const TextStyle(color: AppColors.hintText),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.textFormField),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.textFormField),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Button(formKey: _formKey, buttonName: 'Send',route: Verification.routeName,),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Remember your password?',
              style: TextStyle(color: AppColors.sidedText),
            ),
            ClickableText(
                padding: 10,
                route: LoginScreen.routeName,
                text: 'SIGN IN',
                color: AppColors.importantText,
                fontWeight: FontWeight.bold
            )
          ]
        )
        ],
      )
    );
  }
}