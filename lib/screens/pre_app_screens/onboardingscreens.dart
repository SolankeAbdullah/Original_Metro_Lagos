import 'package:flutter/material.dart';
import 'package:real_metro/screens/pre_app_screens/signup_page.dart';
import 'package:real_metro/shared_widget.dart/onbarding_custom.dart';

class OnboardingScreenPage extends StatefulWidget {
  const OnboardingScreenPage({super.key});

  @override
  _OnboardingScreenPageState createState() => _OnboardingScreenPageState();
}

class _OnboardingScreenPageState extends State<OnboardingScreenPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalSteps = 3;
  double _currentStep = 0;
  final Color _progressColor = Colors.blue; // Set your desired color here

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth * 0.9, // Adjust the width as needed
        height: screenHeight * 0.9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  _currentStep = (index + 1) * (100 / _totalSteps);
                });
              },
              children: const [
                OnboardingScreenWidget(
                  imagePath: "assets/images/pngs/OnboardingPic.png",
                  title: "Top Class Train\nRides",
                  description:
                      "Where the best destinations\nmeets your  taste of travel.",
                ),
                OnboardingScreenWidget(
                  imagePath: "assets/images/pngs/Onboarding1.jpeg",
                  title: "Book Train Tickets!",
                  description: "• Live journey info at a glance\n"
                      "• Quick travel Updates\n"
                      "• Secure Payment portals",
                ),
                OnboardingScreenWidget(
                  imagePath: "assets/images/pngs/Onboarding3.jpeg",
                  title: "Freedom at your\nfingertips",
                  description: "you decide the place & time",
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircularStepFAB(
                currentStep: _currentStep,
                progressColor: _progressColor,
                onPressed: () {
                  if (_currentPage < _totalSteps - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                    );
                  } else {
                    // Navigate to SignUp page if on the last page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularStepFAB extends StatelessWidget {
  final double currentStep;
  final Color progressColor;
  final VoidCallback onPressed;

  const CircularStepFAB({
    super.key,
    required this.currentStep,
    required this.progressColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double angle = 2 * 3.141592653589793 * (currentStep / 100);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: progressColor.withOpacity(0.8),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: progressColor,
          ),
          child: Center(
            child: Text(
              '${currentStep.toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: angle,
          child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: progressColor,
            child: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
