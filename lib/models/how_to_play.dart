// To parse this JSON data, do
//
//     final howToPlay = howToPlayFromJson(jsonString);

import 'dart:convert';

HowToPlay howToPlayFromJson(String str) => HowToPlay.fromJson(json.decode(str));

String howToPlayToJson(HowToPlay data) => json.encode(data.toJson());

class HowToPlay {
  bool? success;
  String? message;
  Data? data;

  HowToPlay({
    this.success,
    this.message,
    this.data,
  });

  factory HowToPlay.fromJson(Map<String, dynamic> json) => HowToPlay(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
