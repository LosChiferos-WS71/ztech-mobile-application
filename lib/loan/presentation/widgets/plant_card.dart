import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/loan/domain/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.grey,
      onTap: () {
        // mensaje
      },
      child: SizedBox(
        width: 150,
        height: 280,
        child: Column(
          children: [
            Image.asset(
              plant.imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              plant.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              plant.description,
            ),
          ],
        ),
      ),
    ));
  }
}
