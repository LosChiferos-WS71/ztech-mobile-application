import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          child: _selectedIndex ==3 // Para cambiar a la vista según las opciones del toolbar(0, 1, 2, 3)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter the plant you want to search for',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/Logo-ztech-inicio.png',
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Not found',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sorry, the keyword you entered cannot be found. Please check again or search with another keyword.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : const Center(
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
}