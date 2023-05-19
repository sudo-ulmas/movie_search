import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_search/repository/search_repository.dart';

import '../model/movie.dart';

part 'search_bloc.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search(String query) = _SearchQuery;
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState.init() = _Initial;

  const factory SearchState.inProgress() = _InProgress;

  const factory SearchState.loaded(List<Movie> movies) = _Loaded;

  const factory SearchState.failed(String error) = _Failed;
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;
  SearchBloc(this._repository) : super(const SearchState.init()) {
    on<SearchEvent>(
      (event, emit) => event.map(
        search: (value) => _search(emit, value.query),
      ),
    );
  }

  Future<void> _search(Emitter<SearchState> emit, String query) async {
    emit(const SearchState.inProgress());
    final result = await _repository.searchMovies(query);
    if (result.isRight) {
      emit(SearchState.loaded(result.right));
    } else {
      emit(SearchState.failed(result.left));
    }
  }
}
