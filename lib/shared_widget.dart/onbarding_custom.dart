import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Align(
        // Align the Container at the top with specified padding
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 375,
                width: 341,
                color: const Color(0xFFC4C4C4),
                child: Image.asset("name"),
              ),
              const SizedBox(height: 44.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0F0E0E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: screenHeight * 0.7,
                  width: screenWidth * 0.7,
                  child: const Image(
                    image: AssetImage(
                      "assets/images/pngs/OnboardingPic.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextWidget(
                text: "Top Class Train\nRides",
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 51, 65, 188),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const TextWidget(
                text:
                    "Where the best destinations\nmeets your  taste of travel.",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextWidget({
    super.key,
    this.text = '',
    this.fontSize = 32.0,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.7,
                child: const Image(
                  image: AssetImage(
                    "assets/images/pngs/Onboarding1.jpeg",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Book Train Tickets!",
              fontSize: 32,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 25, 13, 186),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "• Live journey info at a glance\n",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8.0,
            ),
            const TextWidget(
              text: "• Quick travel Updates\n",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8.0,
            ),
            const TextWidget(
              text: "• Secure Payment portals",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.7,
                child: const Image(
                  image: AssetImage(
                    "assets/images/pngs/Onboarding3.jpeg",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextWidget(
              text: "Freedom at your\nfingertips",
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 51, 62, 209),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextWidget(
              text: "you decide the place & time",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
