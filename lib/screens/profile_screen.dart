import 'package:flutter/material.dart';
import 'package:real_metro/shared_widget.dart/text_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.userName});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final String userName;
  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstnameController.text;
      final lastName = _lastnameController.text;
      final email = _emailController.text;
      final phoneNumber = _phonenumberController.text;

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Dummy API call using JSONPlaceholder's fake API
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: jsonEncode({
          'title': 'Form Submission',
          'body':
              'First Name: $firstName, Last Name: $lastName, Email: $email, Phone Number: $phoneNumber',
          'userId': 1,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // API call successful
        print('API Response: ${response.body}');
        _formKey.currentState!.reset();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form submitted successfully!')),
        );
      } else {
        // API call failed
        print('API Error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error submitting form')),
        );
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.amberAccent),
        title: const Center(child: Text('Profile')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to MyTicketsScreen
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image_picker_widget(),
          Text(
            userName,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          const Text(
            "User Account",
            style: TextStyle(color: Colors.lightGreen),
          ),
          TextFieldWidget(
            title: "UserName",
            hintText: 'RodiyatBebe1',
            controller: _usernameController,
            borderColor: Colors.green,
            validator: (input) {
              // Add your validation logic here
              if (input!.isEmpty) {
                return 'Name is required!';
              }

              if (input.length < 5) {
                return 'Please enter a valid name!';
              }

              return null;
            },
          ),
          TextFieldWidget(
              title: "First name",
              hintText: "Rodiyat",
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your first name';
                }

                // Check if the first name contains only alphabetic characters
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'First name should only contain letters';
                }

                // Check if the first name is at least 2 characters long
                if (value.length < 2) {
                  return 'First name must be at least 2 characters long';
                }

                // Check if the first name is not too long
                if (value.length > 50) {
                  return 'First name is too long';
                }

                // All validation rules passed, return null
                return null; // Return null if the input is valid
              },
              controller: _firstnameController),
          TextFieldWidget(
              title: "Last name",
              hintText: "Adesola",
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your last name';
                }

                // Check if the last name contains only alphabetic characters
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Last name should only contain letters';
                }

                // Check if the last name is at least 2 characters long
                if (value.length < 2) {
                  return 'Last name must be at least 2 characters long';
                }

                // Check if the last name is not too long
                if (value.length > 50) {
                  return 'Last name is too long';
                }

                // All validation rules passed, return null
                return null; // Return null if the input is valid
              },
              controller: _lastnameController),
          TextFieldWidget(
              title: "Email",
              hintText: 'RodiyatAdesola@gmail.com',
              validator: (String? input) {
                if (input!.isEmpty) {
                  return 'Email is required!';
                }

                if (input.isNotEmpty) {
                  return 'Enter valid email.';
                }

                return null;
              },
              onTap: () async {},
              readOnly: false,
              controller: _emailController),
          TextFieldWidget(
              title: "Phone number",
              hintText: '+23488476848838',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your phone number';
                }

                // Check if the phone number is in a valid format (e.g., 123-456-7890)
                if (!RegExp(r'^\d{3}-\d{3}-\d{4}$').hasMatch(value)) {
                  return 'Please enter a valid phone number (e.g., 123-456-7890)';
                }

                // All validation rules passed, return null
                return null; // Return null if the input is valid
              },
              controller: _phonenumberController),
          // Other TextFieldWidget widgets

          ElevatedButton(
            onPressed: () => _submitForm(context),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class image_picker_widget extends StatelessWidget {
  const image_picker_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 94,
        height: 92,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_alt_rounded,
            size: 32,
          ),
        ),
      ),
    );
  }
}
