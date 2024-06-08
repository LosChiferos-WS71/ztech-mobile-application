import 'package:flutter/material.dart';

class SplashRecoverPasswordScreen extends StatefulWidget {
  const SplashRecoverPasswordScreen({super.key});

  @override
  _SplashRecoverPasswordScreenState createState() => _SplashRecoverPasswordScreenState();
}

class _SplashRecoverPasswordScreenState extends State<SplashRecoverPasswordScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("email-sent");
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