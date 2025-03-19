import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  final String title;
  final String content;
  final Widget? widget;

  const AccountSettings({
    super.key,
    this.widget,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.hintText, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: const TextStyle(color: AppColors.sidedText, fontSize: 18),
              ),
            ),
            widget ?? const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
