// To parse this JSON data, do
//
//     final gameResultresponce = gameResultresponceFromJson(jsonString);

import 'dart:convert';

GameResultResponce gameResultresponceFromJson(String str) => GameResultResponce.fromJson(json.decode(str));

String gameResultresponceToJson(GameResultResponce data) => json.encode(data.toJson());

class GameResultResponce {
  bool? success;
  List<ResultData>? data;
  String? currentPage;
  int? page;

  GameResultResponce({
    this.success,
    this.data,
    this.currentPage,
    this.page,
  });

  factory GameResultResponce.fromJson(Map<String, dynamic> json) => GameResultResponce(
    success: json["success"],
    data: json["data"] == null ? [] : List<ResultData>.from(json["data"]!.map((x) => ResultData.fromJson(x))),
    currentPage: json["currentPage"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "currentPage": currentPage,
    "page": page,
  };
}

class ResultData {
  String? id;
  String? result;
  String? marketName;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ResultData({
    this.id,
    this.result,
    this.marketName,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
    id: json["_id"],
    result: json["result"],
    marketName: json["marketName"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "result": result,
    "marketName": marketName,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
