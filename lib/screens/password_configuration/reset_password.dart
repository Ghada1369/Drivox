import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static String routeName = '/resetPassword';
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrivoxLogo(text: 4),
          const SizedBox(height: 20),
          Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !isPasswordVisible,
                    cursorColor: AppColors.textFormField,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      if (value.length < 8 || value.length > 20) {
                        return 'Must be between 8 and 20 characters';
                      }
                      return null;
                    },
                    style: const TextStyle(color: AppColors.textFormField),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: AppColors.hintText),
                      errorStyle: const TextStyle(color: AppColors.error),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.gray200,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textFormField),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textFormField),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Confirm Password Field
                  TextFormField(
                    obscureText: !isConfirmPasswordVisible,
                    cursorColor: AppColors.textFormField,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    style: const TextStyle(color: AppColors.textFormField),
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: AppColors.hintText),
                      errorStyle: const TextStyle(color: AppColors.error),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          });
                        },
                        child: Icon(
                          isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.gray200,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textFormField),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textFormField),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.error),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        side: const BorderSide(color: AppColors.buttonBorder,),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: AppColors.textFormField,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      )
    );
  }
}
