import 'package:blabla/services/ride_prefs_service.dart';
import 'package:blabla/ui/screens/ride_pref/seat_selection.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:blabla/ui/widgets/display/location_picker_modal.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    departureDate = DateTime.now();
    requestedSeats = 1;
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void _onSwitchLocation() {
    setState(() {
      Location? temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  bool get isLocationsSelected => departure != null && arrival != null;

  Future<Location?> _showLocationPicker() async {
    final Location? selected = await showModalBottomSheet<Location>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (BuildContext context) {
        return const LocationPickerModal();
      },
    );
    return selected;
  }

  Future<void> _onSelectedDeparture() async {
    Location? selectedLocation = await _showLocationPicker();
    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  Future<void> _onSelectedArrival() async {
    Location? selectedLocation = await _showLocationPicker();
    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  Future<void> _onSelectSeat() async {
    int selectedSeat = await Navigator.push(
      context,
      AnimationUtils.createRightToLeftRoute(
        SeatSelection(iniSeat: requestedSeats),
      ),
    );
    if (selectedSeat != requestedSeats) {
      setState(() {
        requestedSeats = selectedSeat;
      });
    }
  }

  Future<void> _onSearchRide() async {
    if (departure == null) {
      _onSelectedDeparture();
    } else if (arrival == null) {
      _onSelectedArrival();
    } else {
      if (departure != arrival && departure != null && arrival != null) {
        RidePrefService.addRidePref(
          RidePref(
            departure: departure!,
            departureDate: departureDate,
            arrival: arrival!,
            requestedSeats: requestedSeats,
          ),
        );
      }
    }
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectionFormTile(
          title: (departure == null) ? "Leaving from " : departure!.name,
          leadingIcon: Icons.radio_button_off_outlined,
          trailingIcon: (isLocationsSelected) ? Icons.swap_vert : null,
          onAction: _onSelectedDeparture,
          onTraingAction: _onSwitchLocation,
        ),
        BlaDivider(),
        SelectionFormTile(
          title: (arrival == null) ? "Going to" : arrival!.name,
          leadingIcon: Icons.radio_button_off_outlined,
          onAction: _onSelectedArrival,
        ),
        BlaDivider(),
        SelectionFormTile(
          title: DateTimeUtils.formatDateTime(departureDate),
          leadingIcon: Icons.calendar_month_outlined,
          onAction: () {},
        ),
        BlaDivider(),
        SelectionFormTile(
          title: requestedSeats.toString(),
          leadingIcon: Icons.person_2_outlined,
          onAction: _onSelectSeat,
        ),
        BlaButton(
          label: "Search",
          radiusGeometry: BorderRadius.only(
            bottomLeft: Radius.circular(BlaSpacings.radius),
            bottomRight: Radius.circular(BlaSpacings.radius),
          ),
          onPressed: _onSearchRide,
        ),
      ],
    );
  }
}

class SelectionFormTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback onAction;
  final VoidCallback? onTraingAction;

  const SelectionFormTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    required this.onAction,
    this.onTraingAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onAction,
      leading: Icon(leadingIcon, color: BlaColors.neutral),
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
      ),
      trailing: (trailingIcon != null && onTraingAction != null)
          ? IconButton(
              onPressed: onTraingAction,
              icon: Icon(trailingIcon, color: BlaColors.primary),
            )
          : SizedBox.shrink(),
    );
  }
}
