// screens/sign_up_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_metro/screens/pre_app_screens/login_screen.dart';
import 'package:real_metro/screens/pre_app_screens/otpverification_screen.dart';
import '../../models/user.dart';
import '../../shared_widget.dart/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({super.key});

  Future _signUp(BuildContext context) async {
    final user = User(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneController.text,
      email: _emailController.text,
      password: _passwordController.text,
      picture: '',
    );
    var url = Uri.https("");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // User registration successful, show a success message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('User registered successfully!'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const OtpVerificationScreen(phoneNumber: '')),
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Handle registration errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Error during registration: ${response.body}'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.9,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the content in SingleChildScrollView
            child: Column(
                // ... Your content here ...
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "Let's Get You Started",
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const Text(
                    "Please fill in your information",
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF6D6D6D)),
                  ),
                  const SizedBox(height: 32.0),
                  CustomTextField(
                    controller: _firstNameController,
                    title: 'First Name',
                    hintText: 'E.g Jide',
                    isPasswordField: false,
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    controller: _lastNameController,
                    title: 'Last Name',
                    hintText: 'E.g Olu',
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    controller: _phoneController,
                    title: 'Phone Number',
                    hintText: 'E.g +23484444555',
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    controller: _emailController,
                    title: 'Email',
                    hintText: 'E.g JideOlu@gmail.com',
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    controller: _passwordController,
                    title: 'Password',
                    isPasswordField: true,
                    hintText: 'E.g Jideolu@123',
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _signUp(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(327, 60),
                        fixedSize: Size(screenWidth, 60),
                        backgroundColor: const Color(0xFF0D6EFD),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  color: Color(0xFF344054),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
