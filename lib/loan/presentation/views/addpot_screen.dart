import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart'; // Importa el app bar de navegación si lo necesitas
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/addpot_invalid_code_screen.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/addpot_valid_code_screen.dart';

class AddPotScreen extends StatefulWidget {
  @override
  _AddPotScreenState createState() => _AddPotScreenState();
}

class _AddPotScreenState extends State<AddPotScreen> {
  int _selectedIndex = 0; // Dejarlo en 0 para que muestre la primera vista

  // Lista de códigos válidos simulados
  final List<String> validCodes = ['A1B2C', 'D3E4F', 'G5H6I'];

  // Controladores para los TextFields
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _validateCode() {
    String enteredCode =
        _controllers.map((controller) => controller.text).join();
    if (validCodes.contains(enteredCode)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AddPotValidCodeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AddPotInvalidCodeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),
        child: Center(
            child: Column(
          children: <Widget>[
            AppBar(
              title: Text(
                'Add Flowerpot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color(0xFF276749),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find the pot code in your email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(5, (index) => buildCodeTextField(index)),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _validateCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF276749),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Add Me',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget buildCodeTextField(int index) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
