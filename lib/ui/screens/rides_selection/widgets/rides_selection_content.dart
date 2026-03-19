import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {}

  void onRideSelected(Ride ride) {}

  void onPreferencePressed(
    BuildContext context,
    RidesSelectionViewModel viewModel,
  ) async {
    RidePreference? newPreference = await Navigator.of(context).push(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: viewModel.selectedRidePreference),
      ),
    );

    if (newPreference != null) {
      viewModel.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RidesSelectionViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.selectedRidePreference,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(context, vm),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: vm.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: vm.matchingRides[index],
                  onPressed: () => onRideSelected(vm.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
