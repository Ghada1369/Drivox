import 'package:drivox/core/assets/app_assets.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DrivoxLogo extends StatelessWidget {
  final int text;
  const DrivoxLogo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              AppAssets.logo,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(80.0),
            child: Divider(),
          ),
          Positioned(
            bottom: 13,
            child: text == 1
                ? const Text(
              'Drive Safe, Stay Awake',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.sidedText,
                fontSize: 18,
              ),
            )
                : text == 2
                ? const Text(
              'Create an Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.sidedText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
                : text == 3
                ? const Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.sidedText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
