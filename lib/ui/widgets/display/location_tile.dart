import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final void Function(Location) onSelectLocation;
  const LocationTile({
    super.key,
    required this.location,
    required this.onSelectLocation,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: BlaSpacings.s,
      title: Text(location.name),
      subtitle: Text(location.country.name),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () => {onSelectLocation(location)},
    );
  }
}
