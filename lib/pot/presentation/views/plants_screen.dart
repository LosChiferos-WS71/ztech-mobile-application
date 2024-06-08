import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/pot/application/plant_available_service.dart';
import 'package:ztech_mobile_application/pot/domain/plant_available.dart';
import 'package:ztech_mobile_application/pot/infrastructure/plant_available_repository.dart';
import 'package:ztech_mobile_application/pot/presentation/views/plant_detail_screen.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/card_plant_available.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/card_plant_simple.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/top_bar.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart';
import 'package:ztech_mobile_application/pot/infrastructure/user_repository.dart';

class PlantsScreen extends StatefulWidget {
  @override
  _PlantsScreenState createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  int _selectedIndex = 2;
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      // Solo actualizar si el índice cambió
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  late Future<User> user;
  late Future<List<PlantAvailable>> availablePlants;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    final userRepository = UserRepository();
    final plantAvailableRepository = PlantAvailableRepository();

    user = userRepository.getUser();
    availablePlants =
        PlantAvailableService(plantAvailableRepository).getAvailablePlants();

    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (searchController.text.isEmpty) {
      setState(() {
        searchQuery = "";
      });
    } else {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "YOUR PLANTS",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
            FutureBuilder<List<dynamic>>(
              future: Future.wait([user, availablePlants]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                          'Error al cargar los datos: ${snapshot.error.toString()}'));
                }
                if (snapshot.hasData) {
                  User currentUser = snapshot.data![0];
                  List<PlantAvailable> plantsAvailable = snapshot.data![1];
                  return Column(
                    children: <Widget>[
                      buildUserPlantsGridView(currentUser.plants),
                      SizedBox(height: 20), // Espacio entre secciones
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0), // Ajusta el padding según necesites
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "MORE PLANTS",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            labelText: "Enter the plant you want to search for",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled:
                                true, // Esta línea activa el relleno del color
                            fillColor: Colors
                                .white, // Esta línea establece el color del relleno
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value.toLowerCase();
                            });
                          },
                        ),
                      ),

                      buildAvailablePlantsGridView(plantsAvailable)
                    ],
                  );
                } else {
                  return Center(child: Text('No se encontraron datos'));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget buildUserPlantsGridView(List<PlantInfo> plants) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Desactiva el scroll interno
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: plants.length,
      itemBuilder: (context, index) {
        return CardPlantSimple(
          plantInfo: plants[index],
          onTap: () {
            // Implementación del onTap si es necesario
          },
        );
      },
    );
  }

  Widget buildAvailablePlantsGridView(List<PlantAvailable> plants) {
    List<PlantAvailable> filteredPlants = plants.where((plant) {
      return plant.plantName.toLowerCase().contains(searchQuery) ||
          plant.scientificName.toLowerCase().contains(searchQuery);
    }).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Desactiva el scroll interno
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: filteredPlants.length,
      itemBuilder: (context, index) {
        return CardPlantAvailable(
          plantAvailable: filteredPlants[index],
          onTap: (plant) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlantDetailScreen(plant: plant)),
            );
          },
        );
      },
    );
  }
}
