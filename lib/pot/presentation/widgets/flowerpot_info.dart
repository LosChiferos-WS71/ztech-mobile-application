import 'package:flutter/material.dart';

class PlantInfoComponent extends StatelessWidget {
  const PlantInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/Logo-ztech-inicio.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 10), // Ajustar padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Alinear hacia la izquierda
                      mainAxisSize:
                          MainAxisSize.max, // Minimizar el tamaño de la fila
                      children: [
                        Flexible(
                          child: infoColumn(), // Info Column for icons and data
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child:
                              infoTextColumn(), // Text Column for "high" texts
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget infoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoRow(Icons.thermostat, "30°"),
        infoRow(Icons.opacity, "75%"),
        infoRow(Icons.wb_sunny, "4 UV"),
      ],
    );
  }

  Widget infoTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText("high"),
        infoText("high"),
        infoText("high"),
      ],
    );
  }

  Widget infoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 24), // Reducir tamaño de icono
          const SizedBox(width: 10),
          Text(text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold)), // Reducir tamaño de texto
        ],
      ),
    );
  }
}
