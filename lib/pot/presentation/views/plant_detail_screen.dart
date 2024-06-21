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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              plant.plantImageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      plant.plantName,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: Text(
                      "${plant.scientificName}",
                      style:
                          TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 14),
              child: Text(
                "Description:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                plant.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 14),
              child: Text(
                "Recommendations:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                plant.recommendation,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 14),
              child: Text(
                "Care Instructions:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            //insert a buttom
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add plant to user's collection
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: Color(0xFF276749),
                    ),
                    child: Text(
                      "Add me to a pot",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
