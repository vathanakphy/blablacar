import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  final List<Ride> _rides = fakeRides;

  @override
  List<Ride> getAllRides() {
    return _rides;
  }

  @override
  List<Ride> getRidesFor(RidePreference preferences) {
    return _rides.where((ride) {
      return ride.departureLocation == preferences.departure &&
          ride.arrivalLocation == preferences.arrival &&
          ride.availableSeats >= preferences.requestedSeats;
    }).toList();
  }
}
