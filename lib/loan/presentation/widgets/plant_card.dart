import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/confirmation_dialog.dart';
import 'package:ztech_mobile_application/loan/domain/plant.dart';
import 'package:ztech_mobile_application/loan/presentation/views/configuration_flowerpot.dart';
import 'package:ztech_mobile_application/loan/presentation/views/loaded_plant_screen.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          message: 'Are you sure you want to add this plant?',
          onYesPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoadingScreen()),
            );
            // Esperar 3 segundos y luego navegar a la siguiente pantalla
            Timer(Duration(seconds: 3), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ConfigureFlowerPot()),
              );
            });
          },
          onNoPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.grey,
      onTap: () {
        _showLogoutDialog(context);
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
