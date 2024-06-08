import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/flowerpot_recomendation.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/flowerpot_info.dart';

class FlowerpotDetailScreen extends StatefulWidget {
  const FlowerpotDetailScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlowerpotDetailScreenState createState() => _FlowerpotDetailScreenState();
}

class _FlowerpotDetailScreenState extends State<FlowerpotDetailScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildCustomAppBar(context),
            const PlantInfoComponent(),
            buildButtons(context),
            const RecommendationComponent(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 5, top: 40, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            iconSize: 36,
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Text('POT 1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold)),
          Opacity(
              opacity: 0.0,
              child: IconButton(
                  icon: const Icon(Icons.arrow_back), onPressed: () {})),
        ],
      ),
    );
  }
}

Widget buildButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'flowerpot_metrics');
            },
            // ignore: sort_child_properties_last
            child: const Text(
              'See stats',
              style: TextStyle(
                fontSize: 24, // Aumentar el tamaño del texto
                fontWeight: FontWeight.bold, // Hacer el texto en negrita
                color: Colors.white, // Definir el color del texto
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF276749),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 16), // Aumentar la altura del botón
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            // ignore: sort_child_properties_last
            child: const Text(
              'Change plant',
              style: TextStyle(
                fontSize: 24, // Aumentar el tamaño del texto
                fontWeight: FontWeight.bold, // Hacer el texto en negrita
                color: Colors.white, // Definir el color del texto
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFF05959),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 16), // Aumentar la altura del botón
            ),
          ),
        ),
      ],
    ),
  );
}
