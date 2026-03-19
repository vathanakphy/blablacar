import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_reposiitory_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride_preference/rde_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/rde_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:provider/provider.dart';

List<InheritedProvider> get devProviders {
  RidePreferenceRepository ridePreferenceRepository =
      RidePreferenceRepositoryMock();
  return [
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    ChangeNotifierProvider<RidePreferencesState>(
      create: (_) => RidePreferencesState(repository: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
