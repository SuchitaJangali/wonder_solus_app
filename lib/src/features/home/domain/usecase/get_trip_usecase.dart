import 'package:fpdart/fpdart.dart';
import 'package:wonder_souls/src/features/home/domain/entities/trip_entity.dart';
import 'package:wonder_souls/src/features/home/domain/repositories/home_repository.dart';

import '../../../../config/model/failure.dart';

class GetTripUseCase {
  final HomeRepository homeRepository;

  GetTripUseCase({required this.homeRepository});

  Future<Either<Failure, List<TripEntity>>> call() async {
    return await homeRepository.getTrips();
  }
}
