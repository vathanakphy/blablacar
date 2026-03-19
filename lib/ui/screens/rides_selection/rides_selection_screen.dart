import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_content.dart';
import 'package:blabla/ui/states/ride_preferences_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePreferencesState = context.read<RidePreferencesState>();
    final rideRepository = context.read<RideRepository>();

    return ChangeNotifierProvider(
      create: (context) => RidesSelectionViewModel(
        ridePreferencesState: ridePreferencesState,
        rideRepository: rideRepository,
      ),
      child: const RidesSelectionContent(),
    );
  }
}
