// models/user.dart
class User {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}
