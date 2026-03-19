import 'package:flutter/material.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState ridePreferencesState;
  final RideRepository rideRepository;

  RidesSelectionViewModel({
    required this.ridePreferencesState,
    required this.rideRepository,
  }) {
    ridePreferencesState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferencesState.removeListener(_onStateChanged);
    super.dispose();
  }

  RidePreference get selectedRidePreference =>
      ridePreferencesState.selectedPreference!;

  List<Ride> get matchingRides =>
      rideRepository.getRidesFor(selectedRidePreference);

  void selectPreference(RidePreference preference) {
    ridePreferencesState.selectPreference(preference);
  }
}
