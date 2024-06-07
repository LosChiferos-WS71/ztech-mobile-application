import 'package:flutter/material.dart';

class PlantInfoComponent extends StatelessWidget {
  const PlantInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Aplica un borde redondeado
              child: Image.network(
                  'https://cdn0.ecologiaverde.com/es/posts/0/7/8/como_crecen_las_plantas_2870_orig.jpg',
                  fit: BoxFit.cover // Establece el ancho al máximo disponible
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Expanded(
              flex: 2,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoRow(Icons.thermostat, "30°"),
                      infoRow(Icons.opacity, "75%"),
                      infoRow(Icons.wb_sunny, "4 UV"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoText("high"),
                      infoText("high"),
                      infoText("high"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget infoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
        ],
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(width: 10),
          Text(text,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
