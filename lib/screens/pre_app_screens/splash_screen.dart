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
    return CircleAvatar(
      radius: 100,
      backgroundColor:
          const Color.fromARGB(0, 118, 114, 114), // Set the background color
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image(
          image: AssetImage('assets/images/pngs/splashscreen.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
