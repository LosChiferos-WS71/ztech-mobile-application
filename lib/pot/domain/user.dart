class PlantInfo {
  final String plantName;
  final String scientificName; // Nuevo campo para el nombre científico
  final String plantImageUrl;
  final Map<String, String> careIcons;

  PlantInfo({
    required this.plantName,
    required this.scientificName, // Incluye el nuevo campo en el constructor
    required this.plantImageUrl,
    required this.careIcons,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) {
    return PlantInfo(
      plantName: json['plantName'],
      scientificName:
          json['scientificName'], // Parsea el nombre científico desde JSON
      plantImageUrl: json['plantImageUrl'],
      careIcons: Map<String, String>.from(json['careIcons']),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String greeting;
  final String profileImageUrl;
  final List<PlantInfo> plants;

  User({
    required this.firstName,
    required this.lastName,
    required this.greeting,
    required this.profileImageUrl,
    required this.plants,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<PlantInfo> plants =
        (json['plants'] as List).map((i) => PlantInfo.fromJson(i)).toList();
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      greeting: json['greeting'],
      profileImageUrl: json['profileImageUrl'],
      plants: plants,
    );
  }
}
