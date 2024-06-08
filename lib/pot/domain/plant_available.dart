class PlantAvailable {
  final String plantName;
  final String scientificName;
  final String plantImageUrl;
  final Map<String, String> careIcons;
  final String description;
  final String recommendation;

  PlantAvailable({
    required this.plantName,
    required this.scientificName,
    required this.plantImageUrl,
    required this.careIcons,
    required this.description,
    required this.recommendation,
  });

  factory PlantAvailable.fromJson(Map<String, dynamic> json) {
    return PlantAvailable(
      plantName: json['plantName'],
      scientificName: json['scientificName'],
      plantImageUrl: json['plantImageUrl'] ??
          '', // Provide a default value if plantImageUrl is null
      careIcons: Map<String, String>.from(json['careIcons']),
      description: json['description'],
      recommendation: json['recommendation'],
    );
  }
}
