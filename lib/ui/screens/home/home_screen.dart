import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePreferencesState = context.read<RidePreferencesState>();
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(ridePreferencesState: ridePreferencesState),
      child: HomeContent(),
    );
  }
}
