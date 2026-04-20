import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/core/model/place_model.dart';
import '../../../../../config/core/services/google_map_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GoogleMapsApiService apiService;
  Timer? _debounce;

  SearchCubit(this.apiService) : super(SearchInitial());

  void onQueryChanged(String query) {

    if (query.isEmpty) {

      emit(SearchInitial());
      return;
    }

    emit(SearchActive(isLoading: true));

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final result = await apiService.searchPlaces(query);

      result.match(
        (failure) => emit(SearchError(failure.message)),
        (places) => emit(SearchLoaded(places: places)),
      );
    });
  }

  void closeSearch() {
    emit(SearchInitial());
  }
}
