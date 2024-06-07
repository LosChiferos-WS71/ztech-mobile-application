import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';

class ChoosePlantScreen extends StatefulWidget {
  @override
  _ChoosePlantScreenState createState() => _ChoosePlantScreenState();
}

class _ChoosePlantScreenState extends State<ChoosePlantScreen> {
  int _selectedIndex = 1; // Dejarlo en 0 para que muestre la primera vista

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
          child: SingleChildScrollView(
            child: Center(
              child: _selectedIndex ==
                      1 // Para cambiar a la vista según las opciones del toolbar(0, 1, 2, 3)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 40),
                              Text(
                                'Configure FlowerPot',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Find your plant so you can insert it into your pot.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText:
                                  'Enter the plant you want to search for',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/NotFound.png',
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Not found',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Sorry, the keyword you entered cannot be found. Please check again or search with another keyword.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Center(
                      child: Text('Other Page'),
                    ),
            ),
          )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
