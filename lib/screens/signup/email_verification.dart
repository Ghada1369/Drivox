import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/signup/successful_email_verification.dart';
import 'package:drivox/widgets/clickable_text.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerification extends StatefulWidget {
  static String routeName = '/emailVerification';
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _VerificationState();
}

class _VerificationState extends State<EmailVerification> {
  bool isVerifying = false;
  bool isResending = false;
  String enteredCode = "";
  final String correctCode = "1234"; // Simulated correct code from email
  String? errorMessage;

  void onCodeChanged(String value) {
    setState(() {
      enteredCode = value;
      errorMessage = null;
    });
  }

  void verifyCode() {
    if (enteredCode.isEmpty) {
      setState(() {
        errorMessage = AppText.error1;
      });
      return;
    }

    if (enteredCode == correctCode) {
      setState(() {
        isVerifying = true;
        errorMessage = null;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => isVerifying = false);
        Navigator.pushNamedAndRemoveUntil(
          context,
          SuccessfulEmailVerification.routeName,
              (route) => false,
        );
      });
    } else {
      setState(() {
        errorMessage = AppText.error2;
      });
    }
  }
  void resendCode() {
    setState(() {
      isResending = true;
      errorMessage = null;
    });
    Future.delayed(const Duration(milliseconds:  400), () {
      setState(() => isResending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppText.snackBarMessage)),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrivoxLogo(text: 6),
          const Text(AppText.checkYourEmail,style: TextStyle(color: AppColors.hintText),),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              enableActiveFill: true,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              onChanged: onCodeChanged,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 50,
                fieldWidth: 50,
                inactiveColor: AppColors.hintText,
                inactiveFillColor: Colors.transparent,
                activeColor: AppColors.hintText,
                activeFillColor: Colors.transparent,
                selectedColor: AppColors.hintText.withOpacity(0.8),
                selectedFillColor: AppColors.hintText.withOpacity(0.4),
              ),
              cursorColor: AppColors.textFormField,
              textStyle: const TextStyle(
                color: AppColors.textFormField,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 10),
            Text(
              errorMessage!,
              style: const TextStyle(color: AppColors.error, fontSize: 15),
            ),
          ],
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: isVerifying ? null : verifyCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                side: const BorderSide(color: AppColors.buttonBorder),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: isVerifying
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ),
              )
                  : const Text(
                AppText.verify,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickableText(
                  padding: 10,
                  onTap: (){Navigator.pop(context);},
                  text: AppText.editEmail,
                  color: AppColors.importantText,
                  fontWeight: FontWeight.bold),
              const SizedBox(width: 20),
              InkWell( //firebase
                onTap: isResending ? null : resendCode,
                child: const Text(
                  AppText.resend,
                  style: TextStyle(
                      color: AppColors.importantText,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
