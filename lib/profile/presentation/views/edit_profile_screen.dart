import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/common/widgets/confirmation_dialog.dart'; // Importa el diálogo

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectedIndex = 3;

  // Controllers para los campos editables
  final TextEditingController nameController = TextEditingController(text: 'Emma Myers');
  final TextEditingController emailController = TextEditingController(text: 'emma@gmail.com');
  final TextEditingController addressController = TextEditingController(text: 'Mz k3 Lote 43 - Pasaje villa lobos');
  final TextEditingController birthdateController = TextEditingController(text: 'September 1, 2001');
  final TextEditingController genderController = TextEditingController(text: 'Male');
  final TextEditingController phoneController = TextEditingController(text: '987654321');
  final TextEditingController newPasswordController = TextEditingController(text: '');
    final TextEditingController repeatPasswordController = TextEditingController(text: '');

 

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          message: 'Are you sure you want to log out?',
          onYesPressed: () {
            // Lógica para cerrar sesión
            Navigator.of(context).pop(); // Cierra el diálogo
          },
          onNoPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
        );
      },
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        birthdateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
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
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: const CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcTLeEbVLhXC_1HLLrigOfSU4C1hRPwu3f4AVcb3oIBzSDPnKcEEO57gfInoZHkgujFV-Vf3SwiuUcNI2x4'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.upload, color: Colors.black),
                            onPressed: () {
                              // ignore: avoid_print
                              print("Edit profile picture button pressed");
                            },
                          ),
                        ),
                      ),
                    ],
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
                    controller: nameController,
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  infoSection(
                    title: 'Email:',
                    controller: emailController,
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                  infoSection(
                    title: 'Adress:',
                    controller: addressController,
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                   infoSection(
                    title: 'Birthdate:',
                    controller: birthdateController,
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                    isDate: true,
                    onIconPressed: () => _selectDate(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Alinea los widgets de manera uniforme en la fila
                    children: [
                      infoSection(
                        title: 'Gender:',
                        controller: genderController,
                        backgroundColor: const Color(0xFFEDEDED),
                        width: MediaQuery.of(context).size.width *
                            0.32, // Aproximadamente 40% del ancho de la pantalla
                      ),
                      infoSection(
                        title: 'Phone:',
                        controller:phoneController,
                        backgroundColor: const Color(0xFFEDEDED),
                        width: MediaQuery.of(context).size.width *
                            0.32, // Aproximadamente 50% del ancho de la pantalla
                      ),
                    ],
                  ),
                  infoSection(
                    title: 'New password:',
                    controller: newPasswordController,
                    backgroundColor: const Color(0xFFEDEDED),
                    width: MediaQuery.of(context).size.width * 0.76,
                  ),
                    infoSection(
                    title: 'Repeat your password:',
                    controller: repeatPasswordController,
                    backgroundColor: const Color(0xFFEDEDED),
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
                        // Lógica al presionar el botón
                      },
                      child: const Text('Save'),
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
  required Color backgroundColor,
  double width = double.infinity,
  required TextEditingController controller,
  bool isDate = false,
  VoidCallback? onIconPressed,
}) {
  return Container(
    width: width,
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextField(
          controller: controller,
          readOnly: isDate,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF276749),
                width: 2,
              ),
            ),
            hintText: 'Enter $title',
            suffixIcon: isDate
                ? IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: onIconPressed,
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}