import 'package:blabla/data/repositories/ride_preference/rde_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _selectedPreference;

  RidePreferencesState({required this.repository});

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get history => repository.getPreferenceHistory();

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      if (!repository.getPreferenceHistory().any((p) => p == preference)) {
        repository.addPreference(preference);
      }
      notifyListeners();
    }
  }
}
