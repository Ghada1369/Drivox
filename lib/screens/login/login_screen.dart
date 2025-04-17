import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:drivox/screens/login/login_form.dart';
import 'package:drivox/screens/password_configuration/forgot_password.dart';
import 'package:drivox/screens/signup/sign_up.dart';
import 'package:drivox/widgets/button.dart';
import 'package:drivox/widgets/clickable_text.dart';
import 'package:drivox/widgets/continue_with_google.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
   LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: true,
      widget:SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrivoxLogo(text: 1),
            const SizedBox(height: 20),
            LoginForm(formKey: formKey,),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClickableText(
                    padding: 8,
                    onTap: (){Navigator.pushNamed(context,ForgotPassword.routeName);},
                    text: AppText.forgotPassword,
                    color: AppColors.sidedText,
                    fontWeight: FontWeight.normal
                ),
              ],
            ),
            const SizedBox(height: 10),
            Button(
              formKey: formKey,
              buttonName: AppText.login,
              onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false,),
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 10,),
            const ContinueWithGoogle(),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppText.needAnAccount,
                  style: TextStyle(color: AppColors.sidedText),
                ),
                ClickableText(
                    padding: 10,
                    onTap: (){Navigator.pushNamed(context,SignUp.routeName); },
                    text: AppText.registerNow,
                    color: AppColors.importantText,
                    fontWeight: FontWeight.bold
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
