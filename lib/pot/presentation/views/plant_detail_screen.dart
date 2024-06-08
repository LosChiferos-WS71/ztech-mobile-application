import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/pot/domain/plant_available.dart';

class PlantDetailScreen extends StatelessWidget {
  final PlantAvailable plant;

  const PlantDetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.scientificName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              plant.plantImageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                plant.plantName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                "Scientific Name: ${plant.scientificName}",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                plant.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Recommendations:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                plant.recommendation,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Care Instructions:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sunlight: ${plant.careIcons['sunlight']}"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.thermostat_outlined),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Temperature: ${plant.careIcons['temperature']}"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.opacity),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Water: ${plant.careIcons['water']}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
