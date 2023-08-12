import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  final logger = Logger();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      // Get the GoogleSignInAuthentication object.
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Now you have a GoogleSignInAuthentication object, and you can use this to authenticate with your backend.
      // For demonstration purposes, we'll set isLoggedIn to true.
      _isLoggedIn = true;
      notifyListeners();
    } catch (error) {
      logger.e('Google Sign-In Error: $error');
      // Handle any errors that occur during Google Sign-In.
      // For demonstration purposes, let's set isLoggedIn to false.
      _isLoggedIn = false;
    }
  }

  Future<void> signOut() async {
    // Implement your sign-out logic here, if needed.
    // For demonstration purposes, we'll set isLoggedIn to false.
    _isLoggedIn = false;
    notifyListeners();
  }
}

final authProviderNotifier = ChangeNotifierProvider((ref) {
  return AuthProvider();
});
