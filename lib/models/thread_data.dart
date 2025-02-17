// To parse this JSON data, do
//
//     final treadDataResponce = treadDataResponceFromJson(jsonString);

import 'dart:convert';

TreadDataResponce treadDataResponceFromJson(String str) => TreadDataResponce.fromJson(json.decode(str));

String treadDataResponceToJson(TreadDataResponce data) => json.encode(data.toJson());

class TreadDataResponce {
  bool? success;
  String? message;
  ThreadData? data;

  TreadDataResponce({
    this.success,
    this.message,
    this.data,
  });

  factory TreadDataResponce.fromJson(Map<String, dynamic> json) => TreadDataResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : ThreadData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class ThreadData {
  String? id;
  String? adminId;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ThreadData({
    this.id,
    this.adminId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ThreadData.fromJson(Map<String, dynamic> json) => ThreadData(
    id: json["_id"],
    adminId: json["adminId"],
    userId: json["userId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "adminId": adminId,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
