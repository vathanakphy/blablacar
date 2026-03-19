import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/rde_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _preferenceHistory = fakeRidePrefs;

  @override
  List<RidePreference> getPreferenceHistory() {
    return _preferenceHistory;
  }
  @override
  void addPreference(RidePreference preference) {
    _preferenceHistory.add(preference);
  }
}
