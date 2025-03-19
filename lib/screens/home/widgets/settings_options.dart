import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  final String title ;
  final bool value;
  final ValueChanged<bool> function;
  const SettingsOptions({
    super.key,
    required this.title,
    required this.value,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
              title,
              style: const TextStyle(
                  color: AppColors.sidedText,
                  fontSize: 18
              )
          ),
        ),
        Switch(
          value: value,
          onChanged: function,
          activeColor: AppColors.sidedText,
          activeTrackColor: AppColors.green,
          inactiveThumbColor: AppColors.hintText,
          inactiveTrackColor: AppColors.buttonBorder,

        ),
      ],
    );
  }
}
