import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationSuccesful extends StatefulWidget {
  const VerificationSuccesful({super.key});

  @override
  State<VerificationSuccesful> createState() => _VerificationSuccesfulState();
}

class _VerificationSuccesfulState extends State<VerificationSuccesful> {
  void signInMethod() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EAEA),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/like-image.svg",
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Verification Successful",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "georgia",
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF898989)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "We have successfully verified your mobile number.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.w400,
                color: Color(0xFF4D4B4B),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "You can now proceed to your login page",
              style: TextStyle(
                fontFamily: "roboto",
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4D4B4B),
              ),
            ),
            const SizedBox(
              height: 230.7,
            ),
            ElevatedButton(
                onPressed: signInMethod,
                style: const  ButtonStyle(),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(128, 20, 128, 20),
                  child: Text("Sign In"),
                )))
          ],
        ),
      ),
    );
  }
}
