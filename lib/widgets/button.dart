import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String buttonName;
  const Button({
    super.key,
    required this.formKey,
    required this.buttonName
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[700],
          side: const BorderSide(color: AppColors.buttonBorder,),
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
