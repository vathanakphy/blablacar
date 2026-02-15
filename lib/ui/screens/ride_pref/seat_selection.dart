import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class SeatSelection extends StatefulWidget {
  final int iniSeat;
  const SeatSelection({super.key, required this.iniSeat});

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  late int currentSeat;
  @override
  void initState() {
    currentSeat = widget.iniSeat;
    super.initState();
  }

  void _onAdd() {
    if (currentSeat == 8) return;
    setState(() {
      currentSeat++;
    });
  }

  void _onRemove() {
    if (currentSeat == 1) return;
    setState(() {
      currentSeat--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlaColors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.clear, size: 24, color: BlaColors.primary),
            ),
          ),
          SizedBox(height: BlaSpacings.m),
          Text(
            "Number of Seats to book",
            style: BlaTextStyles.heading.copyWith(
              color: BlaColors.neutralDark,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: BlaSpacings.xxl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Padding(
                padding: EdgeInsets.only(left: BlaSpacings.l),
                child: IconButton(
                  onPressed: _onRemove,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    size: 36,
                    color: (currentSeat > 1)
                        ? BlaColors.primary
                        : BlaColors.neutral,
                  ),
                ),
              ),
              Text(
                currentSeat.toString(),
                style: BlaTextStyles.body.copyWith(
                  color: BlaColors.neutralDark,
                  fontSize: 46,
                  decoration: TextDecoration.none,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: BlaSpacings.l),
                child: IconButton(
                  onPressed: _onAdd,
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 36,
                    color: (currentSeat < 8)
                        ? BlaColors.primary
                        : BlaColors.neutral,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(currentSeat),
                icon: Icon(
                  Icons.arrow_circle_right_sharp,
                  size: 48,
                  color: BlaColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: BlaSpacings.m),
        ],
      ),
    );
  }
}
