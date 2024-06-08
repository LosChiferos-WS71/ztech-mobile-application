import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart'; // Asegúrate de que la ruta esté correcta

class CardPlant extends StatelessWidget {
  final PlantInfo plantInfo;

  const CardPlant({Key? key, required this.plantInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                plantInfo.plantImageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantInfo.plantName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(plantInfo.careIcons['temperature']!),
                    Image.asset(plantInfo.careIcons['water']!),
                    Image.asset(plantInfo.careIcons['sunlight']!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
