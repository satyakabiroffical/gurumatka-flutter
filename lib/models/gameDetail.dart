// To parse this JSON data, do
//
//     final gameDtaile = gameDtaileFromJson(jsonString);

import 'dart:convert';

GameDtaile gameDtaileFromJson(String str) => GameDtaile.fromJson(json.decode(str));

String gameDtaileToJson(GameDtaile data) => json.encode(data.toJson());

class GameDtaile {
  String? id;
  String? name;
  String? description;
  String? gameClosingTime;
  String? gameOpenTime;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GameDtaile({
    this.id,
    this.name,
    this.description,
    this.gameClosingTime,
    this.gameOpenTime,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GameDtaile.fromJson(Map<String, dynamic> json) => GameDtaile(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    gameClosingTime: json["gameClosingTime"],
    gameOpenTime: json["gameOpenTime"],
    disable: json["disable"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "gameClosingTime": gameClosingTime,
    "gameOpenTime": gameOpenTime,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
