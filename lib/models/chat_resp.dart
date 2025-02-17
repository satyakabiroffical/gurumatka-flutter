// To parse this JSON data, do
//
//     final chatResponce = chatResponceFromJson(jsonString);

import 'dart:convert';

ChatResponce chatResponceFromJson(String str) => ChatResponce.fromJson(json.decode(str));

String chatResponceToJson(ChatResponce data) => json.encode(data.toJson());

class ChatResponce {
  bool? success;
  String? message;
  List<Message>? data;
  int? page;
  String? currentPage;

  ChatResponce({
    this.success,
    this.message,
    this.data,
    this.page,
    this.currentPage,
  });

  factory ChatResponce.fromJson(Map<String, dynamic> json) => ChatResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Message>.from(json["data"]!.map((x) => Message.fromJson(x))),
    page: json["page"],
    currentPage: json["currentPage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "page": page,
    "currentPage": currentPage,
  };
}

class Message {
  String? id;
  String? threadId;
  bool? seen;
  String? type;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Message({
    this.id,
    this.threadId,
    this.seen,
    this.type,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    threadId: json["threadId"],
    seen: json["seen"],
    type: json["type"],
    message: json["message"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "threadId": threadId,
    "seen": seen,
    "type": type,
    "message": message,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
