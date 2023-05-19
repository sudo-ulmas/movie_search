import 'package:either_dart/either.dart';

import '../../../shared/base_api.dart';
import '../../../shared/dio_client.dart';
import '../model/movie.dart';

class SearchApi with BaseApi<List<Movie>> {
  final DioClient _dioClient;

  const SearchApi(this._dioClient);

  Future<Either<String, List<Movie>>> searchMovies(String query) => request(
        () async {
          final response = await _dioClient.dio.get<void>(
            '''${ApiUrl.search}?page=1&limit=10&query=$query''',
          );
          final movies =
              ((response.data as Map<String, dynamic>)['docs'] as List)
                  .map((e) => Movie.fromJson(e as Map<String, dynamic>))
                  .toList();

          return movies;
        },
      );
}
