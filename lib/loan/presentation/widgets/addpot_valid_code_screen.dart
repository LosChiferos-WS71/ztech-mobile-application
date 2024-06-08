import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';

class AddPotValidCodeScreen extends StatefulWidget {
  @override
  _AddPotValidCodeScreenState createState() => _AddPotValidCodeScreenState();
}

class _AddPotValidCodeScreenState extends State<AddPotValidCodeScreen> {
  int _selectedIndex = 1; // Dejarlo en 0 para que muestre la primera vista

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed("choose-plant");
    });
  }

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF276749), // Fondo de color verde
      body: Center(
        child: _selectedIndex == 1 // Para cambiar a la vista según las opciones del toolbar(0, 1, 2, 3)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Logo-ztech-inicio.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Aggregate correctly',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        )
            : Center(
          child: Text('Other Page'),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}

