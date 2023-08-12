// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_metro/providers/auth_provider.dart';
import 'package:real_metro/screens/pre_app_screens/login_screen.dart';
import 'package:real_metro/screens/pre_app_screens/signup_page.dart';
import 'screens/pre_app_screens/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MetroLagosApp()));
}

class MetroLagosApp extends StatelessWidget {
  const MetroLagosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metro Lagos',
      theme: ThemeData(fontFamily: "RobotoMono"),
      home: const SplashScreen(),
      // initial route
    );
  }
}

class AuthProvider extends StateNotifier<bool> {
  AuthProvider() : super(false);

  Future<void> signInWithGoogle() async {
    // Implement your sign-in with Google logic here
    // For demonstration purposes, let's just set the state to true.
    state = true;
  }

  Future<void> signOut() async {
    // Implement your sign-out logic here
    // For demonstration purposes, let's just set the state to false.
    state = false;
  }
}

final authProviderNotifier = StateNotifierProvider<AuthProvider, bool>((ref) {
  return AuthProvider();
});
