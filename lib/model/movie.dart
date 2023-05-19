import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @override
  factory Movie({
    required int id,
    @Default('') String name,
    @Default('') String alternativeName,
    @Default('') String type,
    @Default(2000) int year,
    @Default('') String description,
    @Default('') String shortDescription,
    @Default('') String logo,
    @Default('') String poster,
    @Default('') String backdrop,
    @Default(0) double rating,
    @Default(0) int votes,
    @Default(0) int movieLength,
    @Default([]) List<String> genres,
    @Default([]) List<String> countries,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
