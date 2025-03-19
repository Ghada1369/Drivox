import 'package:drivox/core/assets/app_assets.dart';
import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  static String routeName = '/onboarding.dart';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

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
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    buildPage(
                      title: AppText.title1,
                      description: AppText.description1,
                      textAlign: TextAlign.center,
                      image: AppAssets.pageView1,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    buildPage(
                      title: AppText.title2,
                      description: AppText.description2,
                      textAlign: TextAlign.center,
                      image: AppAssets.pageView2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    buildPage(
                      title: AppText.title3,
                      description: AppText.description3,
                      textAlign: TextAlign.justify,
                      image: AppAssets.pageView3,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    buildPage(
                      title: AppText.title4,
                      description: AppText.description4,
                      textAlign: TextAlign.center,
                      image: AppAssets.pageView4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ],
                ),
              ),
              buildSkipButton(context),
              buildNavigationControls(context),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildNavigationControls(BuildContext context) {
    return Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        AppText.previous,
                        style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                      ),
                    )
                  else
                    const SizedBox(width: 70),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.activeDotColor,
                      dotColor: AppColors.dotColor,
                    ),
                  ),
                  // Next button
                  TextButton(
                    onPressed: () {
                      if (_currentPage < 3) {
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
                      AppText.next,
                      style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
  }

  Positioned buildSkipButton(BuildContext context) {
    return Positioned(
              right: 15,
              top: 20,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  AppText.skip,
                  style: TextStyle(color: AppColors.sidedText, fontSize: 15),
                ),
              ),
            );
  }

  Widget buildPage({required String title, required String description, required TextAlign textAlign, required String image, required double height, required double width,}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              image,
              width: width,
              height: height,
            ),
          ],
        ),
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

