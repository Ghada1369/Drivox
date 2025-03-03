import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:drivox/screens/signup/widgets/signup_form.dart';
import 'package:drivox/widgets/button.dart';
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
            const SizedBox(height: 40),
            Button(formKey: formKey,buttonName: 'SIGN UP',route: HomeScreen.routeName,),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    },
                  child: const Text(
                    'SIGN IN',
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
