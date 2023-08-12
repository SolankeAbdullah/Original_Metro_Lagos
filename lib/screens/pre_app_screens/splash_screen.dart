import 'package:flutter/material.dart';
import 'package:real_metro/screens/pre_app_screens/onboardingscreens.dart';
import 'package:real_metro/shared_widget.dart/onbarding_custom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(0, 118, 114, 114),
            ),
            child: const Image(
              image: AssetImage('assets/images/pngs/splashscreen.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
