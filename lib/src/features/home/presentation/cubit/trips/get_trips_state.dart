part of 'get_trips_cubit.dart';

sealed class GetTripsState extends Equatable {
  const GetTripsState();

  @override
  List<Object> get props => [];
}

final class GetTripsInitial extends GetTripsState {}

final class GetTripsLoading extends GetTripsState {}

final class GetTripsLoaded extends GetTripsState {
  final List<TripEntity> trips;

  const GetTripsLoaded({required this.trips});
}

final class GetTripsError extends GetTripsState {
  final String errorMessge;

  const GetTripsError({required this.errorMessge});
}
