import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final double padding;
  final VoidCallback onTap;
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const ClickableText({
    super.key,
    required this.padding,
    required this.onTap,
    required this.text,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(color: color, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
