import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations =
      fakeLocations; // TODO for now fake data
  static List<Location> filterLocationByName(String name) {
    return availableLocations
        .where((location) => location.name.startsWith(name))
        .toList();
  }

  static Location get currentLocation => availableLocations.first;
}
