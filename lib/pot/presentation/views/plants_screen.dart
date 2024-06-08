import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/pot/presentation/views/flowerpot_detail_screen.dart';
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<User>? user;

  @override
  void initState() {
    super.initState();
    UserRepository userRepository = UserRepository();
    user = userRepository.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: FutureBuilder<User>(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      int itemCount = snapshot.data!.plants.length +
                          1; // +1 para el botón de '+'
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          if (index < snapshot.data!.plants.length) {
                            return CardPlantSimple(
                              plantInfo: snapshot.data!.plants[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FlowerpotDetailScreen(), // Puedes pasar aquí los detalles necesarios
                                  ),
                                );
                              },
                            );
                          } else {
                            // Botón '+' para agregar más plantas
                            return Center(
                              child: RawMaterialButton(
                                onPressed: () {
                                  // Implementa la acción para agregar una nueva planta
                                },
                                elevation: 2.0,
                                fillColor: Color(0xFFEDEDED),
                                child: Icon(
                                  Icons.add,
                                  size: 50.0,
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            );
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child:
                              Text('Error al cargar datos: ${snapshot.error}'));
                    }
                  }
                  return Center(
                      child:
                          CircularProgressIndicator()); // Muestra un spinner de carga
                },
              ),
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
}
