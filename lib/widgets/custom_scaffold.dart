import 'package:drivox/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  static String routeName = '/login';
  final Widget widget;
  final bool enableAnimation; // New parameter

  const CustomScaffold({
    super.key,
    required this.widget,
    this.enableAnimation = true, // Default to true
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _opacity = 1.0;
        });
      });
    } else {
      _opacity = 1.0; // Instantly set to fully visible if animation is disabled
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.gradient1, AppColors.gradient2, AppColors.gradient3],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: widget.enableAnimation ? const Duration(seconds: 1) : Duration.zero,
            opacity: _opacity,
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.textFormField.withOpacity(0.2)),
              ),
              child: widget.widget,
            ),
          ),
        ),
      ),
    );
  }
}
