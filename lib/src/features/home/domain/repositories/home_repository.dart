import 'package:fpdart/fpdart.dart';

import '../../../../config/model/failure.dart';
import '../entities/trip_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<TripEntity>>> getTrips();
}
