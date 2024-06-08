import '../domain/plant_available.dart';
import '../infrastructure/plant_available_repository.dart';

class PlantAvailableService {
  final PlantAvailableRepository _plantAvailableRepository;

  PlantAvailableService(this._plantAvailableRepository);

  Future<List<PlantAvailable>> getAvailablePlants() async {
    return await _plantAvailableRepository.getAvailablePlants();
  }
}
