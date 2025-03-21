// To parse this JSON data, do
//
//     final gameInfo = gameInfoFromJson(jsonString);

import 'dart:convert';

GameInfo gameInfoFromJson(String str) => GameInfo.fromJson(json.decode(str));

String gameInfoToJson(GameInfo data) => json.encode(data.toJson());

class GameInfo {
  String? id;
  int? minAmount;
  int? maxAmount;
  int? jodiPercent;
  int? crossingPercent;
  int? harufPercent;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GameInfo({
    this.id,
    this.minAmount,
    this.maxAmount,
    this.jodiPercent,
    this.crossingPercent,
    this.harufPercent,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) => GameInfo(
    id: json["_id"],
    minAmount: json["minAmount"],
    maxAmount: json["maxAmount"],
    jodiPercent: json["jodiPercent"],
    crossingPercent: json["crossingPercent"],
    harufPercent: json["harufPercent"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "minAmount": minAmount,
    "maxAmount": maxAmount,
    "jodiPercent": jodiPercent,
    "crossingPercent": crossingPercent,
    "harufPercent": harufPercent,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
