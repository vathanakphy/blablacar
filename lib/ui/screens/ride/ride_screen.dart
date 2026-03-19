import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:flutter/material.dart';

class RideScreen extends StatefulWidget {
  final RidePref ridePref;
  const RideScreen({super.key, required this.ridePref});

  @override
  State<RideScreen> createState() => _RideScreenState();

  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";
  String get subtitle =>
      "${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} passenger${ridePref.requestedSeats > 1 ? "s" : ""}";
}

class _RideScreenState extends State<RideScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: BlaColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: BlaSpacings.s,
              vertical: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: BlaColors.neutralDark,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: BlaTextStyles.heading.copyWith(
                          fontSize: 14,
                          color: BlaColors.neutral,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.subtitle,
                        style: BlaTextStyles.label.copyWith(
                          fontSize: 12,
                          color: BlaColors.neutral,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Filter",
                    style: BlaTextStyles.button.copyWith(
                      color: BlaColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateTimeUtils.formatDateTime(widget.ridePref.departureDate),
            style: BlaTextStyles.heading.copyWith(
              color: BlaColors.neutral,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
      ],
    );
  }
}
