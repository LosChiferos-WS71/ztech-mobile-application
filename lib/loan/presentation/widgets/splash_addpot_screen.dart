import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/addpot_invalid_code_screen.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/addpot_valid_code_screen.dart';

class SplashAddpotScreen extends StatefulWidget {
  final bool isValid;

  const SplashAddpotScreen({Key? key, required this.isValid}) : super(key: key);

  @override
  _SplashAddpotScreenState createState() => _SplashAddpotScreenState();
}

class _SplashAddpotScreenState extends State<SplashAddpotScreen> {
  @override
  void initState() {
    super.initState();

    // Navegar a la pantalla correspondiente después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.isValid
              ? AddPotValidCodeScreen()
              : AddPotInvalidCodeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF276749),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo-ztech-inicio.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
