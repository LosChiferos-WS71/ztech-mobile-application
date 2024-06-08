import 'dart:async';

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
  late StreamController<String> searchStreamController;
  late Future<User> user;
  late Future<List<PlantAvailable>> availablePlants;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      // Solo actualizar si el índice cambió
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchStreamController = StreamController<String>.broadcast();
    final userRepository = UserRepository();
    final plantAvailableRepository = PlantAvailableRepository();
    user = userRepository.getUser();
    availablePlants =
        PlantAvailableService(plantAvailableRepository).getAvailablePlants();
    searchController.addListener(() {
      searchStreamController.add(searchController.text.toLowerCase());
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchStreamController.close();
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
            // Agregar primero la sección de las plantas del usuario
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "YOUR PLANTS",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  FutureBuilder<List<dynamic>>(
                    future: Future.wait([user, availablePlants]),
                    builder: (context, snapshotFuture) {
                      if (!snapshotFuture.hasData) return SizedBox();
                      List<PlantInfo> userPlants =
                          snapshotFuture.data![0].plants;
                      return buildUserPlantsGridView(userPlants);
                    },
                  ),
                ],
              ),
            ),
            // Sección "MORE PLANTS"
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Column(
                children: [
                  Align(
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
                  SizedBox(height: 10),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Enter the plant you want to search for",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Vista de plantas filtradas por la búsqueda
            StreamBuilder<String>(
              stream: searchStreamController.stream,
              builder: (context, snapshot) {
                // Aquí pasamos snapshot.data ?? "" que es el valor actual del searchQuery
                return FutureBuilder<List<dynamic>>(
                  future: Future.wait([user, availablePlants]),
                  builder: (context, snapshotFuture) {
                    if (!snapshotFuture.hasData) return SizedBox();
                    List<PlantAvailable> plants = snapshotFuture.data![1];
                    return buildAvailablePlantsGridView(plants,
                        snapshot.data ?? ""); // Pasamos el searchQuery aquí
                  },
                );
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

  Widget buildAvailablePlantsGridView(
      List<PlantAvailable> plants, String searchQuery) {
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
