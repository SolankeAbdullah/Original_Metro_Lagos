class User {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String picture; // Add the picture property

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.picture, // Initialize the picture property
  });
}
