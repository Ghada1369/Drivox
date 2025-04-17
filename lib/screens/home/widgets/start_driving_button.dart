import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/driving.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class StartDrivingButton extends StatefulWidget {
  const StartDrivingButton({super.key});

  @override
  State<StartDrivingButton> createState() => _StartDrivingButtonState();
}

class _StartDrivingButtonState extends State<StartDrivingButton> {
  void startDriving() {
    if (selectedContacts.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  '${AppText.driveDrivingDialog1} ${selectedContacts[0].displayName}?',
                  style: const TextStyle(fontSize: 15 ,color: AppColors.gradient3),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.button),),
                child: TextButton(
                  onPressed: () {Navigator.pushNamedAndRemoveUntil(context, Driving.routeName, (route) => false,);},
                  child: const Text(
                    AppText.confirmDialog,
                    style: TextStyle(fontSize: 15 ,color: AppColors.gradient3),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.button),),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    AppText.cancel,
                    style: TextStyle(fontSize: 15 ,color: AppColors.gradient3),
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 60,
      right: 60,
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: selectedContacts.isEmpty ? null : startDriving,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(selectedContacts.isEmpty ? AppColors.hintText : AppColors.green),
          ),
          child: const Text(AppText.startDriving,style: TextStyle(color: AppColors.white,fontSize: 16),),
        ),
      ),
    );
  }
}
