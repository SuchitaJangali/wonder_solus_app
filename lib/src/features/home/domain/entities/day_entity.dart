import 'package:wonder_souls/src/config/core/model/object_id.dart';

import 'scheduled_place_entity.dart';

class DayEntity {
  final Id? dayId;
  final String date;
  final String notes;
  final List<ScheduledPlaceEntity> scheduledPlaces;

  const DayEntity({
    this.dayId,
    required this.date,
    required this.notes,
    this.scheduledPlaces = const [],
  });
}
