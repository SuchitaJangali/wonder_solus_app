import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wonder_souls/src/features/home/domain/entities/trip_entity.dart';

import '../../../domain/usecase/get_trip_usecase.dart';

part 'get_trips_state.dart';

class GetTripsCubit extends Cubit<GetTripsState> {
  final GetTripUseCase getTripUseCase;

  GetTripsCubit(this.getTripUseCase) : super(GetTripsInitial());

  void getTrips() async {
    emit(GetTripsLoading());

    final result = await getTripUseCase();

    result.match(
      (failure) => emit(GetTripsError(errorMessge: failure.message)),
      (places) => emit(GetTripsLoaded(trips: places)),
    );
  }
}
