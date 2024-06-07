import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/top_bar.dart';

class FlowerpotsScreen extends StatefulWidget {
  @override
  _FlowerpotsScreenState createState() => _FlowerpotsScreenState();
}

class _FlowerpotsScreenState extends State<FlowerpotsScreen> {
  int _selectedIndex = 0; // Este índice representa la pantalla "Flowerpots"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // Usa tu AppBar personalizado
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: Center(
          child: Text("Bienvenido a la pantalla de Flowerpots"),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
              // Agrega la lógica para cambiar de pantalla
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourNewScreen()));
            });
          }
        },
      ),
    );
  }
}
