import 'package:fpdart/fpdart.dart';
import 'package:wonder_souls/src/config/model/api_result.dart';
import 'package:wonder_souls/src/config/model/failure.dart';

import 'package:wonder_souls/src/features/home/data/datasource/home_remote_datasource.dart';
import 'package:wonder_souls/src/features/home/data/models/trip_model.dart';

import '../../../../config/model/success.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDatasource _homeRemoteDatasource;

  HomeRepositoryImplementation({
    required HomeRemoteDatasource homeRemoteDatasource,
  }) : _homeRemoteDatasource = homeRemoteDatasource;

  @override
  Future<Either<Failure, List<TripModel>>> getTrips() async {
    try {
      ApiResult result = await _homeRemoteDatasource.getTrips();

      if (result is Failure<String>) {
        return Left(result);
      }

      final trips = (result as Success<List<TripModel>>).data;

      return Right(trips);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
