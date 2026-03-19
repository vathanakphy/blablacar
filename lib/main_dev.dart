import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_reposiitory_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:provider/provider.dart';

import 'main_common.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
  ];
}

void main() {
  mainCommon(devProviders);
}
