import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/common/widgets/navigation_appbar.dart';
import 'package:ztech_mobile_application/common/widgets/diagonal_background_painter.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/splash_addpot_screen.dart';

class AddPotScreen extends StatefulWidget {
  @override
  _AddPotScreenState createState() => _AddPotScreenState();
}

class _AddPotScreenState extends State<AddPotScreen> {
  int _selectedIndex = 1;

  final List<String> validCodes = ['A1B2C', 'D3E4F', 'G5H6I'];

  final List<TextEditingController> _controllers =
  List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(5, (_) => FocusNode());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _validateCode() {
    String enteredCode =
    _controllers.map((controller) => controller.text).join();
    bool isValid = validCodes.contains(enteredCode);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashAddpotScreen(
          isValid: isValid,
        ),
      ),
    );
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
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add Flowerpot',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Color(0xFF276749),
                leading: Container(),
                leadingWidth: 0,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Color(0xFFededed),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                5, (index) => buildCodeTextField(index)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validar el código si todos los campos están llenos
                    if (_controllers.every((controller) =>
                    controller.text.isNotEmpty)) {
                      _validateCode();
                    }
                  },
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
          ),
        ),
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
    focusNode: _focusNodes[index],
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    maxLength: 1,
    onChanged: (value) {
    if (value.isEmpty && index > 0) {
    _focusNodes[index].unfocus();
    _focusNodes[index - 1].requestFocus();
    } else if (value.isNotEmpty && index < _controllers.length - 1) {
    _focusNodes[index].unfocus();
    _focusNodes[index + 1].requestFocus();
    }
    // Validar el código si todos los campos están llenos

    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      _validateCode();
    }
    },
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 20),
    ),
    );
  }
}

