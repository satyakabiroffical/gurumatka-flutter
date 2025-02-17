// To parse this JSON data, do
//
//     final appInfoResponce = appInfoResponceFromJson(jsonString);

import 'dart:convert';

AppInfoResponce appInfoResponceFromJson(String str) => AppInfoResponce.fromJson(json.decode(str));

String appInfoResponceToJson(AppInfoResponce data) => json.encode(data.toJson());

class AppInfoResponce {
  bool? success;
  String? message;
  Data? data;

  AppInfoResponce({
    this.success,
    this.message,
    this.data,
  });

  factory AppInfoResponce.fromJson(Map<String, dynamic> json) => AppInfoResponce(
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
  String? title;
  String? description;
  String? contactNumber;
  String? whatsaapContact;
  String? downloadLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.title,
    this.description,
    this.contactNumber,
    this.whatsaapContact,
    this.downloadLink,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    contactNumber: json["contactNumber"],
    whatsaapContact: json["whatsaapContact"],
    downloadLink: json["downloadLink"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "contactNumber": contactNumber,
    "whatsaapContact": whatsaapContact,
    "downloadLink": downloadLink,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
