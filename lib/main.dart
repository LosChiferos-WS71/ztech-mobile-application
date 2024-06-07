import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/profile/presentation/views/splash_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/welcome_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/login_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/home_screen.dart';
import 'package:ztech_mobile_application/pot/presentation/views/flowerpot_detail_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'welcome': (context) => WelcomeScreen(),
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'potdetail': (context) => FlowerpotDetailScreen(),
      },
    );
  }
}
