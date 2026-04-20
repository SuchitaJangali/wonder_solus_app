import 'package:wonder_souls/src/config/core/services/api_services.dart';
import 'package:wonder_souls/src/config/model/failure.dart';
import 'package:wonder_souls/src/config/utils/api_constant.dart';
import 'package:wonder_souls/src/features/home/data/models/trip_model.dart';

import '../../../../config/model/api_result.dart';

abstract interface class HomeRemoteDatasource {
  Future<ApiResult<List<TripModel>>> getTrips();
}

class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final ApiService _apiService;

  HomeRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<ApiResult<List<TripModel>>> getTrips() async {
    try {
      ApiResult<List<TripModel>> result = await _apiService.get(
        ApiConstants.trips,
        fromJson: (data) {
          return (data as List).map((e) => TripModel.fromJson(e)).toList();
        },
      );
      return result;
    } on Exception catch (e) {
      return Failure(message: e.toString());
    }
  }
}
