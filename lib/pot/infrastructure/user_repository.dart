import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/user.dart';

class UserRepository {
  Future<User> getUser() async {
    // Simulando carga de datos desde un JSON local
    final String response = await rootBundle.loadString('assets/user.json');
    final data = jsonDecode(response);
    return User.fromJson(data);
  }
}
