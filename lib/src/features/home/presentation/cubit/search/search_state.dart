part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];

  get length => null;
}

class SearchInitial extends SearchState {}

class SearchActive extends SearchState {
  final bool isLoading;

  const SearchActive({this.isLoading = false});

  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<PlaceModel> places;

  const SearchLoaded({required this.places});

  @override
  List<Object> get props => [places];
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
