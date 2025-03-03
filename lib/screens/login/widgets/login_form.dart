import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  bool isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          //Email Field
          TextFormField(
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
          const SizedBox(height: 15),
          // Password Field
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter a Password";
              } else if (value.length < 8) {
                return "Password must be at least 8 characters";
              }
              return null;
            },
            cursorColor: AppColors.textFormField,
            keyboardType: TextInputType.text,
            obscureText: !isVisible,
            style: const TextStyle(color: AppColors.textFormField),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(color: AppColors.hintText),
              errorStyle: const TextStyle(color: AppColors.error),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.gray200,
                ),
              ),
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
        ],
      ),
    );
  }
}
