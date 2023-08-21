// To parse this JSON data, do
//
//     final trendingMov = trendingMovFromJson(jsonString);

import 'dart:convert';

TrendingMov trendingMovFromJson(String str) =>
    TrendingMov.fromJson(json.decode(str));

String trendingMovToJson(TrendingMov data) => json.encode(data.toJson());

class TrendingMov {
  List<MovResult> results;

  TrendingMov({
    required this.results,
  });

  factory TrendingMov.fromJson(Map<String, dynamic> json) => TrendingMov(
        results: List<MovResult>.from(
            json["results"].map((x) => MovResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class MovResult {
  String backdropPath;
  int id;
  String title;

  String posterPath;

  List<int> genreIds;

  double voteAverage;

  MovResult({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.genreIds,
    required this.voteAverage,
  });

  factory MovResult.fromJson(Map<String, dynamic> json) => MovResult(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"] ?? json['name'],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteAverage: json["vote_average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "vote_average": voteAverage,
      };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
