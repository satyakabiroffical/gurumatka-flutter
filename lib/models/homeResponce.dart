// To parse this JSON data, do
//
//     final HomeResponce = HomeResponceFromJson(jsonString);

import 'dart:convert';

HomeResponce HomeResponceFromJson(String str) => HomeResponce.fromJson(json.decode(str));

String HomeResponceToJson(HomeResponce data) => json.encode(data.toJson());

class HomeResponce {
  bool? success;
  String? message;
  Data? data;

  HomeResponce({
    this.success,
    this.message,
    this.data,
  });

  factory HomeResponce.fromJson(Map<String, dynamic> json) => HomeResponce(
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
  List<String>? banner;
  String? gameBanner;
  String? game2Banner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.banner,
    this.gameBanner,
    this.game2Banner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    banner: json["banner"] == null ? [] : List<String>.from(json["banner"]!.map((x) => x)),
    gameBanner: json["gameBanner"],
    game2Banner: json["game2Banner"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "banner": banner == null ? [] : List<dynamic>.from(banner!.map((x) => x)),
    "gameBanner": gameBanner,
    "game2Banner": game2Banner,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
