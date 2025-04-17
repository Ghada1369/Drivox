import 'package:drivox/core/images/app_images.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessfulEmailVerification extends StatefulWidget {
  static String routeName = '/successfulEmailVerification';
  const SuccessfulEmailVerification({super.key});

  @override
  _SuccessfulVerificationState createState() => _SuccessfulVerificationState();
}

class _SuccessfulVerificationState extends State<SuccessfulEmailVerification> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before navigating to LoginScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 25),
              Lottie.asset(
                AppAssets.right,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ],
          ),
          const Text(
            AppText.emailChangedSuccessfully,
            style: TextStyle(
              color: AppColors.textFormField,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            AppText.loginToYourAccount,
            style: TextStyle(
              color: AppColors.textFormField,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
