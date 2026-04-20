import 'budget_entity.dart';
import 'collaborator_entity.dart';
import 'destination_entity.dart';

class TripEntity {
  final String ownerId;
  final String ownerName;
  final String name;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String coverImage;
  final String mainDestination;
  final bool isPublic;

  final List<CollaboratorEntity> collaborators;
  final List<DestinationEntity> destinations;

  final BudgetEntity? budget;

  TripEntity({
    required this.ownerId,
    required this.ownerName,
    required this.name,
    required this.description,
    this.startDate,
    this.endDate,
    required this.coverImage,
    required this.mainDestination,
    required this.isPublic,
    required this.collaborators,
    required this.destinations,
    this.budget,
  });
}
