import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/top_bar.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/card_plant.dart';
import 'package:ztech_mobile_application/pot/infrastructure/user_repository.dart';

class FlowerpotsScreen extends StatefulWidget {
  @override
  _FlowerpotsScreenState createState() => _FlowerpotsScreenState();
}

class _FlowerpotsScreenState extends State<FlowerpotsScreen> {
    int _selectedIndex = 0;

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
                "POTS",
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
                            return CardPlant(
                                plantInfo: snapshot.data!.plants[index]);
                          } else {
                            // Botón '+' más pequeño y ajustado
                            return Center(
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Color(0xFFEDEDED),
                                child: Icon(
                                  Icons.add,
                                  size: 50.0, // Tamaño del icono reducido
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.all(
                                    15.0), // Espacio alrededor del icono ajustado para un botón más pequeño
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
