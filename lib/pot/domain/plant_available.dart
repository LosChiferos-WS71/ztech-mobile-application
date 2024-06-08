class PlantAvailable {
  final String plantName;
  final String scientificName;
  final String plantImageUrl;
  final Map<String, String> careIcons;

  PlantAvailable({
    required this.plantName,
    required this.scientificName,
    required this.plantImageUrl,
    required this.careIcons,
  });

  factory PlantAvailable.fromJson(Map<String, dynamic> json) {
    return PlantAvailable(
      plantName: json['plantName'],
      scientificName: json['scientificName'],
      plantImageUrl: json['plantImageUrl'],
      careIcons: Map<String, String>.from(json['careIcons']),
    );
  }
}
