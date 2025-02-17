// To parse this JSON data, do
//
//     final getBarcodResponce = getBarcodResponceFromJson(jsonString);

import 'dart:convert';

GetBarcodResponce getBarcodResponceFromJson(String str) => GetBarcodResponce.fromJson(json.decode(str));

String getBarcodResponceToJson(GetBarcodResponce data) => json.encode(data.toJson());

class GetBarcodResponce {
  bool? success;
  String? message;
  Data? data;

  GetBarcodResponce({
    this.success,
    this.message,
    this.data,
  });

  factory GetBarcodResponce.fromJson(Map<String, dynamic> json) => GetBarcodResponce(
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
  String? qrCode;
  String? upiId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.qrCode,
    this.upiId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    qrCode: json["qrCode"],
    upiId: json["upiId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "qrCode": qrCode,
    "upiId": upiId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
