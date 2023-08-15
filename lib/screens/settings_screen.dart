import 'package:flutter/material.dart';

import '../shared_widget.dart/container_widget.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.userName});
  final String userName;

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.amberAccent),
          title: const Text('Settings'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to MyTicketsScreen
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image_picker_widget(),
              SizedBox(
                height: 10,
              ),
              Text(
                userName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "User Account",
                style: TextStyle(color: Colors.lightGreen),
              ),
              SizedBox(
                height: 39,
              ),
              CustomContainerWidget(
                text: "Personal Information",
                onTap: () => navigateToScreen(
                    context, ProfilePage(userName: 'userName')),
              ),
              SizedBox(height: 10),
              CustomContainerWidget(
                text: "Update Password",
                onTap: () => navigateToScreen(context, UpdatePasswordScreen()),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomContainerWidget(
                text: "Help Center",
                onTap: () => navigateToScreen(context, HelpCenterScreen()),
              ),
              SizedBox(height: 10),
              CustomContainerWidget(
                text: "About",
                onTap: () => navigateToScreen(context, AboutScreen()),
              ),
              SizedBox(height: 10),
              CustomContainerWidget(
                text: "Delete My Account",
                onTap: () => navigateToScreen(context, DeleteAccountScreen()),
              ),
            ],
          ),
        ));
  }
}

class PersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
      ),
      body: Center(
        child: Text("This is the Personal Information screen"),
      ),
    );
  }
}

class UpdatePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Password"),
      ),
      body: Center(
        child: Text("This is the Update Password screen"),
      ),
    );
  }
}

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      body: Center(
        child: Text("This is the Help Center screen"),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text("This is the About screen"),
      ),
    );
  }
}

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete My Account"),
      ),
      body: Center(
        child: Text("This is the Delete My Account screen"),
      ),
    );
  }
}


// Create similar screen classes for other sections
