import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/plant_available.dart';

class PlantAvailableRepository {
  Future<List<PlantAvailable>> getAvailablePlants() async {
    final String response =
        await rootBundle.loadString('assets/plants_available.json');
    final data = jsonDecode(response) as List;
    return data.map((e) => PlantAvailable.fromJson(e)).toList();
  }
}
