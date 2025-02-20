// To parse this JSON data, do
//
//     final gameData = gameDataFromJson(jsonString);

import 'dart:convert';

GameData gameDataFromJson(String str) => GameData.fromJson(json.decode(str));

String gameDataToJson(GameData data) => json.encode(data.toJson());

class GameData {
  String? event;
  bool? success;
  List<Game>? openGames;
  List<Game>? notOpenGames;

  GameData({
    this.event,
    this.success,
    this.openGames,
    this.notOpenGames,
  });

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
    event: json["event"],
    success: json["success"],
    openGames: json["openGames"] == null ? [] : List<Game>.from(json["openGames"]!.map((x) => Game.fromJson(x))),
    notOpenGames: json["notOpenGames"] == null ? [] : List<Game>.from(json["notOpenGames"]!.map((x) => Game.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "event": event,
    "success": success,
    "openGames": openGames == null ? [] : List<dynamic>.from(openGames!.map((x) => x.toJson())),
    "notOpenGames": notOpenGames == null ? [] : List<dynamic>.from(notOpenGames!.map((x) => x.toJson())),
  };
}

class Game {
  String? id;
  String? name;
  String? description;
  String? gameClosingTime;
  String? gameOpenTime;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Game({
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

  factory Game.fromJson(Map<String, dynamic> json) => Game(
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
