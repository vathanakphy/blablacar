import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/services/ride_prefs_service.dart';
import 'package:blabla/ui/screens/ride_pref/widgets/ride_pref_history_tile.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'widgets/ride_prefs_form.dart';


const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class RidePrefsScreen extends StatelessWidget {
  const RidePrefsScreen({super.key});

  void onRidePrefSelected(RidePref ridePref) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBackground(), _buildForeground()]);
  }

  Widget _buildForeground() {
    return Column(
      children: [
        SizedBox(height: 30),
        Center(
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 130),
        Container(
          margin: EdgeInsets.all(BlaSpacings.s),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            color: Colors.white,
          ),
          child: RidePrefForm(
            initRidePref: RidePrefService.currentRidePref,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: RidePrefService.ridePrefsHistory.length,
            itemBuilder: (context, index) => RidePrefHistoryTile(
              ridePref: RidePrefService.ridePrefsHistory[index],
              onTap: () =>
                  onRidePrefSelected(RidePrefService.ridePrefsHistory[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Image.asset('assets/images/blabla_home.png', fit: BoxFit.cover),
    );
  }
}