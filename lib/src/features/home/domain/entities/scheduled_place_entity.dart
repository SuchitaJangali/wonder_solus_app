
import 'package:wonder_souls/src/config/core/model/object_id.dart';

class ScheduledPlaceEntity {
  final Id? placeId;
  final String placeName;
  final int orderIndex;
  final String startTime;
  final String endTime;
  final String notes;

  const ScheduledPlaceEntity({
    this.placeId,
    required this.placeName,
    required this.orderIndex,
    required this.startTime,
    required this.endTime,
    required this.notes,
  });
}
