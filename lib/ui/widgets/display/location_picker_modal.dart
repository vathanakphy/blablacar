import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/services/location_service.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:blabla/ui/widgets/display/location_tile.dart';
import 'package:flutter/material.dart';

class LocationPickerModal extends StatefulWidget {
  const LocationPickerModal({super.key});

  @override
  State<LocationPickerModal> createState() => _LocationPickerModalState();
}

class _LocationPickerModalState extends State<LocationPickerModal> {
  TextEditingController textEditingController = TextEditingController();
  List<Location> searchLocation = [];
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _onSearchLocation(String name) {
    setState(() {
      searchLocation = LocationsService.filterLocationByName(name);
    });
  }

  void _selectLocaton(Location location) {
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(BlaSpacings.l),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            onChanged: (_) => _onSearchLocation(textEditingController.text),
            decoration: InputDecoration(
              filled: true,
              fillColor: BlaColors.greyLight,
              hintText: "Staton Road or The Bride Cafe",
              prefixIcon: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, size: 16),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: (textEditingController.text == "")
                  ? Icon(null)
                  : IconButton(
                      icon: Icon(Icons.clear, size: 24),
                      onPressed: () => setState(() {
                        textEditingController.clear();
                      }),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(BlaSpacings.radius),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: BlaSpacings.s),
          ...(searchLocation.isEmpty && textEditingController.text != ""
              ? [
                  Text(
                    "We can't find this place. Try Something else",
                    style: BlaTextStyles.label,
                  ),
                ]
              : [
                  ListTile(
                    minVerticalPadding: BlaSpacings.s,
                    title: Text("Use current location"),
                    leading: Icon(Icons.my_location),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () =>
                        _selectLocaton(LocationsService.currentLocation),
                  ),
                  BlaDivider(),
                ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: _buildListOfLocation()),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildListOfLocation() {
    if (searchLocation.isEmpty) return [];
    
    return searchLocation
        .expand(
          //expand allow return multiple
          (location) => [
            LocationTile(location: location, onSelectLocation: _selectLocaton),
            BlaDivider(),
          ],
        )
        .toList();
  }
}
