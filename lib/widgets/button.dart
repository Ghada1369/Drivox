import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String buttonName;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.formKey,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          side: const BorderSide(color: AppColors.buttonBorder),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            color: AppColors.textFormField,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
