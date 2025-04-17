import 'dart:async';
//import 'package:audioplayers/audioplayers.dart'; مش شغاله عندي
import 'package:drivox/core/assets/app_assets.dart';
import 'package:drivox/screens/home/driving.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrivingAlarm extends StatefulWidget {
  static String routeName = '/drivingAlarm';
  const DrivingAlarm({super.key});

  @override
  _DrivingAlarmState createState() => _DrivingAlarmState();
}
//TODO: اي كومنت هيتغير علي حسب الباكيدج
class _DrivingAlarmState extends State<DrivingAlarm> {
  Timer? _timer;
  //final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAlarm();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      final sleeping = await checkIfDriverSleeping();
      if (!sleeping) {
        timer.cancel();
        //player.stop();
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(Driving.routeName, (route) => false,);
      }
    });
  }

  void playAlarm() async {
    //await player.play(AssetSource('sounds/alarm.mp3'));
  }

  @override
  void dispose() {
    _timer?.cancel();
    //player.dispose();
    super.dispose();
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
            Lottie.asset(AppAssets.driving),
          ],
        ),
      ),
    );
  }

  checkIfDriverSleeping() {}// temporary, will be removed after using api
}