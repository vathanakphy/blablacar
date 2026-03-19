import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository {
  final List<Location> _locations = fakeLocations;

  @override
  List<Location> getAvailableLocations() {
    return _locations;
  }

  @override
  Location? getLocationById(String name) {
    try {
      return fakeLocations.firstWhere((location) => location.name == name);
    } catch (e) {
      return null;
    }
  }
}
