import 'package:flutter/material.dart';

class PlantInfoComponent extends StatelessWidget {
  const PlantInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
          height: 250,  // Establece la altura deseada

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 20),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://ojo.pe/resizer/SWeUdUMtIFlYLaiRvd21MLLELnc=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/BKVJFTCTUFEBDLRPZW46RBOW3A.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.12, right: 10), // Ajustar padding basado en el ancho de la pantalla
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: infoColumn(screenWidth), // Pasa screenWidth como parámetro
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: infoTextColumn(screenWidth), // Pasa screenWidth como parámetro
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget infoColumn(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoRow(Icons.thermostat, "30°", screenWidth),
        infoRow(Icons.opacity, "75%", screenWidth),
        infoRow(Icons.wb_sunny, "4 UV", screenWidth),
      ],
    );
  }

  Widget infoTextColumn(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText("high", screenWidth),
        infoText("high", screenWidth),
        infoText("high", screenWidth),
      ],
    );
  }

  Widget infoText(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(text,
          style: TextStyle(
              fontSize: screenWidth * 0.04, // Ajustar tamaño de fuente basado en el ancho de la pantalla
              fontWeight: FontWeight.bold,
              color: Colors.red)),
    );
  }

  Widget infoRow(IconData icon, String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: screenWidth * 0.06), // Ajustar tamaño del icono
          SizedBox(width: 10),
          Text(text,
              style: TextStyle(
                  fontSize: screenWidth * 0.045, // Ajustar tamaño de fuente
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
