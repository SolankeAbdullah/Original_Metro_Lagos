// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:real_metro/screens/home_screen.dart';
import '../../app_images.dart';
import '../../providers/auth_provider.dart';
import '../../shared_widget.dart/custom_elevated_button.dart';
import '../../shared_widget.dart/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final rememberMeProvider = StateProvider<bool>((ref) => false);
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the entire content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (
                  context,
                  ref,
                  _,
                ) {
                  final authProvider = ref.watch(authProviderNotifier);
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 113,
                          child: const Image(
                            image: AssetImage(
                                "assets/images/pngs/splashscreen.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 39, 119, 51)),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              "\"Please fill in your details to access your account"),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          title: "Email",
                          hintText: "oyinsanusi@gmail.com",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined),
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _passwordController,
                          title: "Password",
                          hintText: "***********",
                          suffixIcon: null,
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Consumer(builder: (context, ref, _) {
                          final rememberMe = ref.watch(rememberMeProvider);
                          return CheckboxListTile(
                            value: rememberMe,
                            onChanged: (newValue) {
                              () => ref
                                  .read(rememberMeProvider.notifier)
                                  .state = newValue ?? false;
                            },
                            title: const Text("Remmeber me"),
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }),
                        SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButton(
                            buttonLabel: "Sign In",
                            onPressed: () {
                              // Handle sign-in logic here.
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            userName: '',
                                          )));
                              final rememberMe =
                                  ref.read(rememberMeProvider.notifier).state;
                              logger.d("Remmeber Me : $rememberMe");
                            },
                            imageString: '',
                            backgroundColor: Colors.lightBlueAccent),
                        const SizedBox(height: 16.0),
                        CustomElevatedButton(
                          buttonLabel: "Sign Up With Google",
                          onPressed: () async {
                            // Store the context in a variable before the async call
                            final currentContext = context;
                            await authProvider.signInWithGoogle();

                            // After signing in with Google, navigate to the next screen.
                            if (authProvider.isLoggedIn) {
                              // Use the stored context after the async call is complete
                              Navigator.pushReplacement(
                                currentContext,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          userName: '',
                                        )),
                              );
                            }
                            final rememberMe =
                                ref.read(rememberMeProvider.notifier).state;
                            logger.d("Remmeber Me : $rememberMe");
                          },
                          imageString: AppSvgs.googleIcon,
                          backgroundColor: Color(0xff6d6dd),
                        ),
                        const SizedBox(height: 16.0),
                        InkWell(
                          onTap: () {
                            // Navigate to SignUpScreen when "Register" text is tapped.
                            Navigator.pushNamed(context, 'signUp');
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
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
