import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/loan/presentation/widgets/notification_screen.dart';
import 'package:ztech_mobile_application/pot/presentation/views/flowerpot_metrics_screen.dart';
import 'package:ztech_mobile_application/pot/presentation/views/flowerpots_screen.dart';
import 'package:ztech_mobile_application/loan/presentation/views/choose_plant_screen.dart';
import 'package:ztech_mobile_application/loan/presentation/views/addpot_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/email_sent_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/recover_password_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/register_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/splash_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/welcome_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/login_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/home_screen.dart';
import 'package:ztech_mobile_application/pot/presentation/views/flowerpot_detail_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/profile_screen.dart';
import 'package:ztech_mobile_application/profile/presentation/views/edit_profile_screen.dart';

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
        '/': (context) => const SplashScreen(),
        'welcome': (context) => const WelcomeScreen(),
        'login': (context) => const LoginScreen(),
        'home': (context) => const HomeScreen(),
        'profile': (context) => const ProfileScreen(),
        'edit_profile': (context) => const EditProfileScreen(),
        'register': (context) => SignUpScreen(),
        'choose-plant': (context) => ChoosePlantScreen(),
        'addPot': (context) => AddPotScreen(),
        'recover-password': (context) => const RecoverPasswordScreen(),
        'email-sent': (context) => const EmailSentScreen(),
        'flowerpots': (context) => FlowerpotsScreen(),
        'potdetail': (context) => FlowerpotDetailScreen(),
        'flowerpot_metrics': (context) => FlowerpotMetricsScreen(),
        'notification': (context) => NotificationScreen()
      },
    );
  }
}
