import '../../domain/entities/destination_entity.dart';

class DestinationModel extends DestinationEntity {
  DestinationModel({
    required super.name,
    required super.country,
    required super.region,
    required super.coordinates,
    super.arrivalDate,
    super.departureDate,
    required super.orderIndex,
    required super.status,
  });

  factory DestinationModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return DestinationModel(
        name: "",
        country: "",
        region: "",
        coordinates: [],
        orderIndex: 0,
        status: false,
      );
    }

    return DestinationModel(
      name: json['name'] ?? "",
      country: json['country'] ?? "",
      region: json['region'] ?? "",
      coordinates: List<double>.from(json['coordinates']?['coordinates'] ?? []),
      arrivalDate: json['arrivalDate'] != null
          ? DateTime.tryParse(json['arrivalDate'])
          : null,
      departureDate: json['departureDate'] != null
          ? DateTime.tryParse(json['departureDate'])
          : null,
      orderIndex: json['orderIndex'] ?? 0,
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "country": country,
      "region": region,
      "coordinates": {"type": "Point", "coordinates": coordinates},
      "arrivalDate": arrivalDate?.toIso8601String(),
      "departureDate": departureDate?.toIso8601String(),
      "orderIndex": orderIndex,
      "status": status,
    };
  }
}
