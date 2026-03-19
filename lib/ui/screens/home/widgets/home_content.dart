import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  void onRidePrefSelected(
    BuildContext context,
    RidePreference preference,
    HomeViewModel viewModel,
  ) async {
    viewModel.selectPreference(preference);
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBackground(), _buildForeground(context)]);
  }

  Widget _buildForeground(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),
        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: viewModel.selectedPreference,
                onRidePreferenceSelected: (pref) =>
                    onRidePrefSelected(context, pref, viewModel),
              ),
              SizedBox(height: BlaSpacings.m),
              _buildHistory(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final history = viewModel.preferenceHistory;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () =>
              onRidePrefSelected(context, history[index], viewModel),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset('assets/images/blabla_home.png', fit: BoxFit.cover),
    );
  }
}
