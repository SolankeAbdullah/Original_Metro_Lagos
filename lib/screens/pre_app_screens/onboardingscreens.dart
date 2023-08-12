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
    return Scaffold(
      body: Stack(
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
              OnboardingScreen(),
              OnboardingScreen2(),
              OnboardingScreen3()
            ],
          ),
          Positioned(
            bottom: 30,
            right: 30,
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
