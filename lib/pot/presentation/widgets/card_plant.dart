import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart';

class CardPlant extends StatelessWidget {
  final PlantInfo plantInfo;
  final VoidCallback? onTap;

  const CardPlant({Key? key, required this.plantInfo, this.onTap})
      : super(key: key);

  // Función que retorna un color basado en la entrada de cuidados de la planta
  Color _getColor(String careValue) {
    switch (careValue) {
      case 'alto':
        return Colors.red;
      case 'medio':
        return Colors.orange;
      case 'bajo':
        return Colors.lightGreen;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
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
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centrar horizontalmente
                  children: [
                    SizedBox(height: 4), // Espacio entre el texto y los íconos
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribuir íconos equitativamente
                      children: [
                        Icon(Icons.thermostat,
                            color: _getColor(plantInfo.careIcons[
                                'temperature']!)), // Icono de temperatura
                        Icon(Icons.opacity,
                            color: _getColor(plantInfo
                                .careIcons['water']!)), // Icono de agua
                        Icon(Icons.wb_sunny,
                            color: _getColor(plantInfo
                                .careIcons['sunlight']!)), // Icono de luz solar
                      ],
                    ),
                    SizedBox(height: 5), // Add top margin
                    Text(
                      plantInfo.plantName,
                      textAlign: TextAlign
                          .center, // Asegurar que el texto esté centrado
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Tamaño más grande del texto
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
