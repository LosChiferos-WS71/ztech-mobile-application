import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF276749),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo-ztech-inicio.png'),
            const SizedBox(height: 20),
            const Text(
              'Added plant to your pot',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
