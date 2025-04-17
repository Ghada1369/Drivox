import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/password_configuration/password_verification.dart';
import 'package:drivox/widgets/button.dart';
import 'package:drivox/widgets/clickable_text.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgotPassword';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  ForgotPassword({super.key});


  @override

  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrivoxLogo(text: 3),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _emailController,
              cursorColor: AppColors.textFormField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppText.emailValidator1;
                } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                  return AppText.emailValidator2;
                }
                return null;
              },
              onChanged: (value) {
                _emailController.value = TextEditingValue(
                  text: value.toLowerCase().trim(),
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
              style: const TextStyle(color: AppColors.textFormField),
              decoration: InputDecoration(
                hintText: AppText.email,
                hintStyle: const TextStyle(color: AppColors.hintText),
                errorStyle: const TextStyle(color: AppColors.error),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff6E0A0A)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Button(formKey: _formKey, buttonName: AppText.send,onPressed: ()=>Navigator.pushNamed(context,PasswordVerification.routeName)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppText.rememberYourPassword,
              style: TextStyle(color: AppColors.sidedText),
            ),
            ClickableText(
                padding: 10,
                onTap: (){Navigator.pop(context);},
                text: AppText.signIn,
                color: AppColors.importantText,
                fontWeight: FontWeight.bold
            )
          ]
        )
        ],
      )
    );
  }
}