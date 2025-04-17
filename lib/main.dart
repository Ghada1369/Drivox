import 'package:drivox/screens/home/driving.dart';
import 'package:drivox/screens/home/drivingAlarm.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:drivox/screens/home/settings.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:drivox/screens/onboarding/onboarding.dart';
import 'package:drivox/screens/password_configuration/forgot_password.dart';
import 'package:drivox/screens/password_configuration/reset_password.dart';
import 'package:drivox/screens/password_configuration/successful_password_verification.dart';
import 'package:drivox/screens/password_configuration/password_verification.dart';
import 'package:drivox/screens/signup/email_verification.dart';
import 'package:drivox/screens/signup/sign_up.dart';
import 'package:drivox/screens/signup/successful_email_verification.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Drivox());
}

class Drivox extends StatelessWidget {
  const Drivox({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Onboarding.routeName : (context)=> const Onboarding(),
        LoginScreen.routeName : (context)=> LoginScreen(),
        SignUp.routeName : (context)=> SignUp(),
        EmailVerification.routeName : (context)=> const EmailVerification(),
        SuccessfulEmailVerification.routeName : (context)=> const SuccessfulEmailVerification(),
        ForgotPassword.routeName : (context)=> ForgotPassword(),
        PasswordVerification.routeName : (context)=> const PasswordVerification(),
        ResetPassword.routeName : (context)=> ResetPassword(),
        SuccessfulPasswordVerification.routeName : (context)=> const SuccessfulPasswordVerification(),


        HomeScreen.routeName : (context)=> HomeScreen(),
        Settings.routeName : (context)=> const Settings(),
        Driving.routeName : (context)=> const Driving(),
        DrivingAlarm.routeName : (context)=> const DrivingAlarm(),

      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
