import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart'; // Importa el app bar de navegación si lo necesitas
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';

class AddPotScreen extends StatefulWidget {
  @override
  _AddPotScreenState createState() => _AddPotScreenState();
}

class _AddPotScreenState extends State<AddPotScreen> {
  int _selectedIndex = 0; // Dejarlo en 0 para que muestre la primera vista

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
        child: Center(
          child: _selectedIndex == 1 // Para cambiar a la vista según las opciones del toolbar(0, 1, 2, 3)
              ? Column(
            children: <Widget>[
              AppBar(
                title: Text(
                  'Add Flowerpot',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xFF276749), // Color del AppBar
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildCodeTextField(),
                        buildCodeTextField(),
                        buildCodeTextField(),
                        buildCodeTextField(),
                        buildCodeTextField(),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print('Add Me button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF276749),
                      ),
                      child: Text(
                        'Add Me',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : Center(
            child: Text('Other Page'),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget buildCodeTextField() {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 20),
      ),
    );
  }



}
