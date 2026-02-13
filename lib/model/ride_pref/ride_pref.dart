import '../ride/locations.dart';

///
/// This model describes a ride preference.
/// A ride preference consists of the selection of a departure + arrival + a date and a number of passenger
///
class RidePref {
  final Location departure;
  final DateTime departureDate;
  final Location arrival;
  final int requestedSeats;

  const RidePref({
    required this.departure,
    required this.departureDate,
    required this.arrival,
    required this.requestedSeats,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RidePref &&
        other.arrival == arrival &&
        other.departure == departure &&
        other.departureDate == departureDate &&
        other.requestedSeats == requestedSeats;
  }

  @override
  String toString() {
    return 'RidePref(departure: ${departure.name}, '
        'departureDate: ${departureDate.toIso8601String()}, '
        'arrival: ${arrival.name}, '
        'requestedSeats: $requestedSeats)';
  }

  RidePref copyWith({
    Location? departure,
    DateTime? departureDate,
    Location? arrival,
    int? requestedSeats,
  }) {
    return RidePref(
      departure: departure ?? this.departure,
      departureDate: departureDate ?? this.departureDate,
      arrival: arrival ?? this.arrival,
      requestedSeats: requestedSeats ?? this.requestedSeats,
    );
  }

  @override
  int get hashCode =>
      arrival.hashCode ^
      departure.hashCode ^
      departureDate.hashCode ^
      requestedSeats;
}
