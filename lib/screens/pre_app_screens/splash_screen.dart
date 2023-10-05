import 'package:flutter/material.dart';
import 'package:real_metro/screens/pre_app_screens/onboardingscreens.dart';
import 'package:real_metro/shared_widget.dart/onbarding_custom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay of 3 seconds
    Future.delayed(const Duration(seconds: 10), () {
      // Navigate to the OnboardingScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreenPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 37.0, right: 37.0),
        child: Center(
          child: _buildSplashImage(),
        ),
      ),
    );
  }

  Widget _buildSplashImage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.9, // Adjust the width as needed
      height: screenHeight * 0.9,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Set the shape to circle
        color: Colors.blue, // Set the background color
      ),
      child: Image(
        image: AssetImage('assets/images/pngs/splashscreen.jpeg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
