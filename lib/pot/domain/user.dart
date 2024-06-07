class User {
  final String firstName;
  final String lastName;
  final String greeting;
  final String profileImageUrl; // Nueva propiedad para la imagen de perfil

  User(
      {required this.firstName,
      required this.lastName,
      required this.greeting,
      required this.profileImageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      greeting: json['greeting'],
      profileImageUrl: json[
          'profileImageUrl'], // Asegúrate de que este campo exista en tu JSON
    );
  }
}
