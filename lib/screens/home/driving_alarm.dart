import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:drivox/core/audios/app_audios.dart';
import 'package:drivox/core/images/app_images.dart';
import 'package:drivox/screens/home/driving.dart';
import 'package:drivox/widgets/custom_scaffold.dart';
import 'package:drivox/widgets/drivox_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrivingAlarm extends StatefulWidget {
  static String routeName = '/drivingAlarm';
  @override
  _DrivingAlarmState createState() => _DrivingAlarmState();
}

class _DrivingAlarmState extends State<DrivingAlarm> {
  Timer? _timer;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAlarm(); // شغلي الصوت
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      final sleeping = await checkIfDriverSleeping();
      if (!sleeping) {
        timer.cancel();
        player.stop(); // وقفي الصوت
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Driving()),
        );
      }
    });
  }

  void playAlarm() async {
    await player.play(AssetSource(AppAudios.alarm));
  }

  @override
  void dispose() {
    _timer?.cancel();
    player.dispose();
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
            Lottie.asset(AppAssets.drivingAlarm),
          ],
        ),
      ),
    );
  }

  checkIfDriverSleeping() {}
}