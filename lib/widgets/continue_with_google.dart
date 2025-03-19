import 'package:drivox/core/assets/app_assets.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.14,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textFormField),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.google,
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              const SizedBox(width: 10),
              const Text(
                AppText.continueWithGoogle,
                style: TextStyle(
                  color: AppColors.sidedText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
