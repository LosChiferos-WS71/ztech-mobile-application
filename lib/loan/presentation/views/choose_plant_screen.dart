import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/loan/domain/plant.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/plant_card.dart';

class ChoosePlantScreen extends StatefulWidget {
  @override
  _ChoosePlantScreenState createState() => _ChoosePlantScreenState();
}

class _ChoosePlantScreenState extends State<ChoosePlantScreen> {
  int _selectedIndex = 1; // Dejarlo en 0 para que muestre la primera vista
  String _searchText = "";
  List<Plant> _plants = [
    Plant(
        name: "PLANT 1", description: "Plant 1", imageUrl: "assets/plant1.png"),
    Plant(
        name: "PLANT 2", description: "Plant 2", imageUrl: "assets/plant2.png"),
    Plant(
        name: "PLANT 3", description: "Plant 3", imageUrl: "assets/plant3.png"),
    Plant(
        name: "PLANT 4", description: "Plant 4", imageUrl: "assets/plant1.png"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Plant> filteredPlants = _plants
        .where((plant) =>
            plant.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: SingleChildScrollView(
          child: Center(
            child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Configure FlowerPot',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Find your plant so you can insert it into your pot.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Enter the plant you want to search for',
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
                          onChanged: (text) {
                            setState(() {
                              _searchText = text;
                            });
                          },
                        ),
                      ),
                      filteredPlants.isEmpty
                          ? Column(
                              children: [
                                Image.asset(
                                  'assets/NotFound.png',
                                  width: 250,
                                  height: 250,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Not found',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Sorry, the keyword you entered cannot be found. Please check again or search with another keyword.',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.8, // Ajustar este valor si es necesario
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                                itemCount: filteredPlants.length,
                                itemBuilder: (context, index) {
                                  return PlantCard(
                                      plant: filteredPlants[index]);
                                },
                              ),
                            ),
                    ],
                  )
                
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
