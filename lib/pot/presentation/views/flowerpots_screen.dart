import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/pot/presentation/widgets/top_bar.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart'; // Asegúrate de que la ruta de importación esté correcta
import 'package:ztech_mobile_application/pot/presentation/widgets/card_plant.dart'; // Importa tu widget CardPlant
import 'package:ztech_mobile_application/pot/infrastructure/user_repository.dart'; // Importa el UserRepository

class FlowerpotsScreen extends StatefulWidget {
  @override
  _FlowerpotsScreenState createState() => _FlowerpotsScreenState();
}

class _FlowerpotsScreenState extends State<FlowerpotsScreen> {
  int _selectedIndex = 0; // Este índice representa la pantalla "Flowerpots"
  Future<User>? user;

  @override
  void initState() {
    super.initState();
    UserRepository userRepository =
        UserRepository(); // Instancia de tu UserRepository
    user = userRepository.getUser(); // Obtiene el usuario y las plantas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(), // Usa tu AppBar personalizado
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 10, // Espacio horizontal
                    mainAxisSpacing: 10, // Espacio vertical
                    childAspectRatio: 0.8, // Aspecto de las tarjetas
                  ),
                  itemCount: snapshot.data!.plants.length,
                  itemBuilder: (context, index) {
                    return CardPlant(plantInfo: snapshot.data!.plants[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error al cargar datos: ${snapshot.error}'));
              }
            }
            return Center(
                child:
                    CircularProgressIndicator()); // Muestra un spinner de carga
          },
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
