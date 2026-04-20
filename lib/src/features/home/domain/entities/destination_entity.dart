class DestinationEntity {
  final String name;
  final String country;
  final String region;
  final List<double> coordinates;
  final DateTime? arrivalDate;
  final DateTime? departureDate;
  final int orderIndex;
  final bool status;

  DestinationEntity({
    required this.name,
    required this.country,
    required this.region,
    required this.coordinates,
    this.arrivalDate,
    this.departureDate,
    required this.orderIndex,
    required this.status,
  });
}
