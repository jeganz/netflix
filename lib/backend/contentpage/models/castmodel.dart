// To parse this JSON data, do
//
//     final cast = castFromJson(jsonString);

import 'dart:convert';

Cast castFromJson(String str) => Cast.fromJson(json.decode(str));

String castToJson(Cast data) => json.encode(data.toJson());

class Cast {
  int id;
  List<CastElement> cast;

  Cast({
    required this.id,
    required this.cast,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        cast: List<CastElement>.from(
            json["cast"].map((x) => CastElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}

class CastElement {
  int gender;
  int id;

  String name;
  String? profilePath;
  String? character;

  CastElement({
    required this.gender,
    required this.id,
    required this.name,
    this.profilePath,
    this.character,
  });

  factory CastElement.fromJson(Map<String, dynamic> json) => CastElement(
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        profilePath: json["profile_path"],
        character: json["character"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "id": id,
        "name": name,
        "profile_path": profilePath,
        "character": character,
      };
}
