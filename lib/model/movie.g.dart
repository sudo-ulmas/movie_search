// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      alternativeName: json['alternativeName'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as int? ?? 2000,
      description: json['description'] as String? ?? '',
      shortDescription: json['shortDescription'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      poster: json['poster'] as String? ?? '',
      backdrop: json['backdrop'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      votes: json['votes'] as int? ?? 0,
      movieLength: json['movieLength'] as int? ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      countries: (json['countries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'type': instance.type,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'logo': instance.logo,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'rating': instance.rating,
      'votes': instance.votes,
      'movieLength': instance.movieLength,
      'genres': instance.genres,
      'countries': instance.countries,
    };
