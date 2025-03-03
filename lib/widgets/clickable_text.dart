import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final double padding;
  final String route;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const ClickableText({
    super.key,
    required this.padding,
    required this.route,
    required this.text,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: (){
          Navigator.pushReplacementNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(color: color,fontWeight: fontWeight),
        ),
      ),
    );
  }
}
