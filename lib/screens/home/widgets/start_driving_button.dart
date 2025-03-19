import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
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
          title: const Text(AppText.startDriving),
          content: Text('${AppText.driveDrivingDialog1} ${selectedContacts[0].displayName}?'),
            actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppText.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${AppText.driveDrivingDialog2} ${selectedContacts[0].displayName}')),
                );
              },
              child: const Text(AppText.confirmDialog),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 60,
      right: 60,
      child: ElevatedButton(
        onPressed: selectedContacts.isEmpty ? null : startDriving,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(selectedContacts.isEmpty ? AppColors.hintText : AppColors.green),
        ),
        child: const Text(AppText.startDriving,style: TextStyle(color: AppColors.white),),
      ),
    );
  }
}
