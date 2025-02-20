// To parse this JSON data, do
//
//     final getNotificationResponce = getNotificationResponceFromJson(jsonString);

import 'dart:convert';

GetNotificationResponce getNotificationResponceFromJson(String str) => GetNotificationResponce.fromJson(json.decode(str));

String getNotificationResponceToJson(GetNotificationResponce data) => json.encode(data.toJson());

class GetNotificationResponce {
  bool? success;
  String? message;
  List<UserNotification>? data;

  GetNotificationResponce({
    this.success,
    this.message,
    this.data,
  });

  factory GetNotificationResponce.fromJson(Map<String, dynamic> json) => GetNotificationResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<UserNotification>.from(json["data"]!.map((x) => UserNotification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserNotification {
  String? id;
  String? title;
  String? description;
  bool? seen;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? userId;

  UserNotification({
    this.id,
    this.title,
    this.description,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userId,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) => UserNotification(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    seen: json["seen"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "seen": seen,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "userId": userId,
  };
}













