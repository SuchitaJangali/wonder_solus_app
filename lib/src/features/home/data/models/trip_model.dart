import '../../domain/entities/trip_entity.dart';
import 'budget_model.dart';
import 'collaborator_model.dart';
import 'destination_model.dart';

class TripModel extends TripEntity {
  TripModel({
    required super.ownerId,
    required super.ownerName,
    required super.name,
    required super.description,
    super.startDate,
    super.endDate,
    required super.coverImage,
    required super.mainDestination,
    required super.isPublic,
    required super.collaborators,
    required super.destinations,
    super.budget,
  });

  // =========================
  // FROM JSON
  // =========================
  factory TripModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TripModel(
        ownerId: "",
        ownerName: "",
        name: "",
        description: "",
        coverImage: "",
        mainDestination: "",
        isPublic: false,
        collaborators: [],
        destinations: [],
      );
    }

    return TripModel(
      ownerId: json['ownerId'] ?? "",
      ownerName: json['ownerName'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",

      startDate: json['startDate'] != null
          ? DateTime.tryParse(json['startDate'])
          : null,

      endDate: json['endDate'] != null
          ? DateTime.tryParse(json['endDate'])
          : null,

      coverImage: json['coverImage'] ?? "",
      mainDestination: json['mainDestination'] ?? "",
      isPublic: json['isPublic'] ?? false,

      collaborators:
          (json['collaborators'] as List?)
              ?.map((e) => CollaboratorModel.fromJson(e))
              .toList() ??
          [],

      destinations:
          (json['destinations'] as List?)
              ?.map((e) => DestinationModel.fromJson(e))
              .toList() ??
          [],

      budget: json['budget'] != null
          ? BudgetModel.fromJson(json['budget'])
          : null,
    );
  }

  // =========================
  // TO JSON
  // =========================
  Map<String, dynamic> toJson() {
    return {
      "ownerId": ownerId,
      "ownerName": ownerName,
      "name": name,
      "description": description,
      "startDate": startDate?.toIso8601String(),
      "endDate": endDate?.toIso8601String(),
      "coverImage": coverImage,
      "mainDestination": mainDestination,
      "isPublic": isPublic,

      "collaborators": collaborators
          .map((e) => (e as CollaboratorModel).toJson())
          .toList(),

      "destinations": destinations
          .map((e) => (e as DestinationModel).toJson())
          .toList(),

      "budget": (budget as BudgetModel?)?.toJson(),
    };
  }
}
