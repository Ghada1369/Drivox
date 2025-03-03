import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  static String routeName = '/onboarding.dart';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: [
                    buildPage(
                      title: AppText.title1,
                      description: AppText.description1,
                      textAlign: TextAlign.center
                    ),
                    buildPage(
                      title: AppText.title2,
                      description: AppText.description2,
                      textAlign: TextAlign.center
                    ),
                    buildPage(
                      title: AppText.title3,
                      description: AppText.description3,
                      textAlign: TextAlign.justify
                    ),
                    buildPage(
                      title: AppText.title4,
                      description: AppText.description4,
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 15,
                top: 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        'Previous',
                        style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white12,
                        dotColor: Colors.white60,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_controller.page! < 3) {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        } else {
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage({required String title, required String description, required TextAlign textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.sidedText,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: textAlign,
            style: const TextStyle(
              color: AppColors.sidedText,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

