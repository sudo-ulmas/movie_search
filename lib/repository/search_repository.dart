import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:movie_search/repository/search_api.dart';

import '../model/movie.dart';

class SearchRepository {
  final SearchApi _api;
  const SearchRepository(this._api);

  Future<Either<String, List<Movie>>> searchMovies(String query) async {
    final result = await _api.searchMovies(query);
    if (result.isRight) {
      final movies = result.right;

      return Right(movies);
    }

    return Left(result.left);
  }
}
