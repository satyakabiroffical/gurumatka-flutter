// To parse this JSON data, do
//
//     final leaderBoardApiResponce = leaderBoardApiResponceFromJson(jsonString);

import 'dart:convert';

import 'package:guru_matka_new/models/verifyOTpREsponce.dart';

LeaderBoardApiResponce leaderBoardApiResponceFromJson(String str) => LeaderBoardApiResponce.fromJson(json.decode(str));

String leaderBoardApiResponceToJson(LeaderBoardApiResponce data) => json.encode(data.toJson());

class LeaderBoardApiResponce {
  bool? success;
  String? message;
  Data? data;

  LeaderBoardApiResponce({
    this.success,
    this.message,
    this.data,
  });

  factory LeaderBoardApiResponce.fromJson(Map<String, dynamic> json) => LeaderBoardApiResponce(
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
  List<Winners>? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    user: json["user"] == null ? [] : List<Winners>.from(json["user"]!.map((x) => Winners.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Winners {
  User? userId;
  int? points;
  String? id;

  Winners({
    this.userId,
    this.points,
    this.id,
  });

  factory Winners.fromJson(Map<String, dynamic> json) => Winners(
    userId: json["userId"] == null ? null : User.fromJson(json["userId"]),
    points: json["points"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId?.toJson(),
    "points": points,
    "_id": id,
  };
}

