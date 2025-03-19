import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/screens/signup/email_verification.dart';
import 'package:drivox/screens/signup/signup_form.dart';
import 'package:drivox/widgets/button.dart';
import 'package:drivox/widgets/continue_with_google.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String routeName = '/signup';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrivoxLogo(text: 2),
            const SizedBox(height: 20),
            SignUpForm(formKey: formKey),
            const SizedBox(height: 30),
            Button(formKey: formKey,buttonName: AppText.signUp,onPressed: ()=>Navigator.pushNamed(context,EmailVerification.routeName),),
            const SizedBox(height: 20),
            const ContinueWithGoogle(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppText.alreadyHaveAnAccount,
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.routeName,);
                    },
                  child: const Text(
                    AppText.signIn,
                    style: TextStyle(color: AppColors.importantText,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
