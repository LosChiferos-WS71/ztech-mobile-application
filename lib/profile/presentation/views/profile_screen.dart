import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/utils/local_persistance.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/confirmation_dialog.dart';
import 'package:ztech_mobile_application/profile/presentation/views/welcome_screen.dart'; // Importa el diálogo

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LocalPersistance _localPersistance = LocalPersistance();
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          message: 'Are you sure you want to log out?',
          onYesPressed: () {
            // Lógica para cerrar sesión
            _localPersistance.logout();
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            (Route<dynamic> route) => false,
          );
          },
          onNoPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: ListView(
          // Changed from Center to ListView for scrolling
          children: <Widget>[
            // Profile Header
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Alinea los hijos a ambos extremos
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.power_settings_new,
                        color: Colors.red), // Icono como en la imagen
                    onPressed: _showLogoutDialog,
                    iconSize: 35, // Tamaño del icono
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                        2), // Ajusta el espacio para el borde
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Color del borde
                        width: 4, // Grosor del borde
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 75, // Tamaño del CircleAvatar
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcTLeEbVLhXC_1HLLrigOfSU4C1hRPwu3f4AVcb3oIBzSDPnKcEEO57gfInoZHkgujFV-Vf3SwiuUcNI2x4'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            50), // Ajusta esto para cambiar el ancho del Divider
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  infoSection(
                    title: 'Name and lastname:',
                    content: 'Emma Myers',
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  infoSection(
                    title: 'Email:',
                    content: 'emma@gmail.com',
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  infoSection(
                    title: 'Adress:',
                    content: 'Mz k3 Lote 43 - Pasaje villa lobos',
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  infoSection(
                    title: 'Birthdate:',
                    content: 'September 1, 2001',
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Alinea los widgets de manera uniforme en la fila
                    children: [
                      infoSection(
                        title: 'Gender:',
                        content: 'Male',
                        backgroundColor: const Color(0xFFEDEDED),
                        width: MediaQuery.of(context).size.width *
                            0.32, // Aproximadamente 40% del ancho de la pantalla
                      ),
                      infoSection(
                        title: 'Phone:',
                        content: '987 654 321',
                        backgroundColor: const Color(0xFFEDEDED),
                        width: MediaQuery.of(context).size.width *
                            0.32, // Aproximadamente 50% del ancho de la pantalla
                      ),
                    ],
                  ),
                  infoSection(
                    title: 'Password:',
                    content: 'asdadsdasdas',
                    backgroundColor: const Color(0xFFEDEDED),
                    isPassword: true, // Activa la lógica de la contraseña
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300, // Ancho específico del botón
                    height: 60, // Alto específico del botón
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF276749),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              50), // Radio del borde redondeado
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'edit_profile');
                        // Lógica al presionar el botón
                      },
                      child: const Text('Edit Profile'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
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

Widget infoSection({
  required String title,
  required String content,
  required Color backgroundColor,
  double width = double.infinity,
  bool isPassword = false,
}) {
  // ignore: no_leading_underscores_for_local_identifiers
  bool _passwordVisible = false; // Inicializar fuera de StatefulBuilder

  return Container(
    width: width,
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isPassword)
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        if (!isPassword)
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        if (isPassword)
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          _passwordVisible
                              ? content
                              : '••••••••', // Cambia entre contenido real y puntos
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    iconSize: 24,
                    onPressed: () {
                      setState(() => _passwordVisible =
                          !_passwordVisible); // Cambia el estado de visibilidad correctamente
                    },
                  ),
                ],
              );
            },
          ),
      ],
    ),
  );
}
