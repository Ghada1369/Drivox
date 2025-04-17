import 'package:drivox/core/images/app_images.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/driving_alarm.dart';
import 'package:drivox/screens/home/home_screen.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class Driving extends StatefulWidget {
  static String routeName = '/driving';
  const Driving({super.key});

  @override
  State<Driving> createState() => _DrivingState();
}

class _DrivingState extends State<Driving> {
  checkIfDriverSleeping() {}// TODO: فانكشن مؤقته عشان ميبقاش في ايرور.امسحها بعد ما تربط بال api
  void startSleepMonitor() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      final sleeping = await checkIfDriverSleeping(); // API call دي الربط
      if (sleeping) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, DrivingAlarm.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableAnimation: false,
      widget: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrivoxLogo(text: 1),
            Center(child: Lottie.asset(AppAssets.driving)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => finishDriving(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    side: const BorderSide(color: AppColors.buttonBorder),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          AppText.tripCompleted,
                          style: TextStyle(
                            color: AppColors.textFormField,
                            fontSize: 18,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void finishDriving(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16,bottom: 16),
              child: Text(
                  AppText.finishDriving,
                  style: TextStyle(fontSize: 15 ,color: AppColors.gradient3)),
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.button)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 25,left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          AppText.yes,
                          style: TextStyle(fontSize: 15 ,color: AppColors.gradient3)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.button)
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.only(right: 25,left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          AppText.cancel,
                          style: TextStyle(fontSize: 15 ,color: AppColors.gradient3)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
}