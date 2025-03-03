import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:drivox/screens/login/widgets/login_form.dart';
import 'package:drivox/screens/password_configuration/forgot_password.dart';
import 'package:drivox/screens/signup/sign_up.dart';
import 'package:drivox/widgets/button.dart';
import 'package:drivox/widgets/clickable_text.dart';
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
      widget:Column(
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
                  route: ForgotPassword.routeName,
                  text: 'Forgot Password',
                  color: AppColors.sidedText,
                  fontWeight: FontWeight.normal
              ),
            ],
          ),
          const SizedBox(height: 40),
          Button(formKey: formKey,buttonName: 'LOGIN',route: HomeScreen.routeName,),
          const SizedBox(height: 15),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Text(
                 "Need an Account?",
                 style: TextStyle(color: AppColors.sidedText),
               ),
               ClickableText(
                   padding: 10,
                   route: SignUp.routeName,
                   text: 'Register Now',
                   color: AppColors.importantText,
                   fontWeight: FontWeight.bold
               )
             ],
           ),
        ],
      ),
    );
  }
}
