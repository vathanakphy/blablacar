import 'package:blabla/model/ride/locations.dart';

abstract class LocationRepository {
  List<Location> getAvailableLocations();
  Location? getLocationById(String name);
}