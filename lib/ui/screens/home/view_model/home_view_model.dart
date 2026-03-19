import 'package:flutter/material.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState ridePreferencesState;

  HomeViewModel({required this.ridePreferencesState}) {
    ridePreferencesState.addListener(notifyListeners);
  }

  RidePreference? get selectedPreference =>
      ridePreferencesState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      ridePreferencesState.history.reversed.toList();

  void selectPreference(RidePreference preference) {
    ridePreferencesState.selectPreference(preference);
  }

}
