import 'package:drivox/core/assets/app_assets.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessfulPasswordVerification extends StatelessWidget {
  static String routeName = '/successfulPasswordVerification';
  const SuccessfulPasswordVerification({super.key});

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
              const SizedBox(width: 25,),
              Lottie.asset(
                AppAssets.right,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.3,
              ),
            ],
          ),
          const Text(
            AppText.passwordChangedSuccessfully,
            style: TextStyle(
                color: AppColors.textFormField,
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false,);
                  },
                child: const Text(
                  AppText.login,
                  style: TextStyle(
                      color: AppColors.importantText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
