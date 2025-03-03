import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgotPassword';
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors:[AppColors.gradient1,AppColors.gradient2,AppColors.gradient3],
    ),
      ),
    child: const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Drivox',
            style: TextStyle(
              color: AppColors.textFormField,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),


        ],
      ),
    ),
      )
    );
}
}
