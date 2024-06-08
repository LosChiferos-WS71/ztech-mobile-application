import 'dart:async';
import 'package:flutter/material.dart';

class EmailSentScreen extends StatefulWidget {
  const EmailSentScreen({Key? key}) : super(key: key);

  @override
  _EmailSentScreenState createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  @override
  void initState() {
    super.initState();
    // Espera 3 segundos y luego regresa a la pantalla anterior
    Timer(Duration(seconds: 2), () {
      //Navigator.pop(context);
       Navigator.pushNamed(context, 'login');

       /*MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      );*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF276749), // Fondo verde oscuro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo-ztech-inicio.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Email Sent',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}