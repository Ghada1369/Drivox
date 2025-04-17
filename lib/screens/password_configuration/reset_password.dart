import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/password_configuration/successful_password_verification.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static String routeName = '/resetPassword';
  bool needCurrentPassword ;
  ResetPassword({super.key,this.needCurrentPassword = false});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isCurrentPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

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
              key: _formKey,
              child: Column(
                children: [
                  widget.needCurrentPassword
                      ? Column(
                    children: [
                      //current password
                      TextFormField(
                        controller: _currentPasswordController,
                        obscureText: !isCurrentPasswordVisible,
                        cursorColor: AppColors.textFormField,
                        validator: (value) {
                          return (value == null || value.isEmpty) ? AppText.setCurrentPassword: null;
                        },
                        style: const TextStyle(color: AppColors.textFormField),
                        decoration: InputDecoration(
                          hintText: AppText.currentPassword,
                          hintStyle: const TextStyle(color: AppColors.hintText),
                          errorStyle: const TextStyle(color: AppColors.error),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isCurrentPasswordVisible = !isCurrentPasswordVisible;
                              });
                            },
                            child: Icon(
                              isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                    ],
                  ) : const SizedBox(),
                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !isPasswordVisible,
                    cursorColor: AppColors.textFormField,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppText.enterPassword;
                      }
                      if (value.length < 8 || value.length > 20) {
                        return AppText.passwordValidator3;
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return AppText.passwordValidation1;
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return AppText.passwordValidation2;
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return AppText.passwordValidation3;
                      }
                      if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return AppText.passwordValidation4;
                      }
                      return null;
                    },
                    style: const TextStyle(color: AppColors.textFormField),
                    decoration: InputDecoration(
                      hintText: AppText.password,
                      hintStyle: const TextStyle(color: AppColors.hintText),
                      errorStyle: const TextStyle(color: AppColors.error, ),
                      helperText: AppText.passwordHintText,
                      helperStyle: const TextStyle(color: AppColors.hintText),
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
                  // Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !isConfirmPasswordVisible,
                    cursorColor: AppColors.textFormField,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppText.enterPassword;
                      }
                      if (value != _passwordController.text) {
                        return AppText.passwordsDoNotMatch;
                      }
                      return null;
                    },
                    style: const TextStyle(color: AppColors.textFormField),
                    decoration: InputDecoration(
                      hintText: AppText.confirmPassword,
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
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(context, SuccessfulPasswordVerification.routeName, (route) => false,);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        side: const BorderSide(color: AppColors.buttonBorder),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        AppText.reset,
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
