// To parse this JSON data, do
//
//     final withdrawHistoryResponce = withdrawHistoryResponceFromJson(jsonString);

import 'dart:convert';

WithdrawHistoryResponce withdrawHistoryResponceFromJson(String str) => WithdrawHistoryResponce.fromJson(json.decode(str));

String withdrawHistoryResponceToJson(WithdrawHistoryResponce data) => json.encode(data.toJson());

class WithdrawHistoryResponce {
  bool? success;
  String? message;
  List<WithdrawData>? data;
  int? page;
  int? currentPage;

  WithdrawHistoryResponce({
    this.success,
    this.message,
    this.data,
    this.page,
    this.currentPage,
  });

  factory WithdrawHistoryResponce.fromJson(Map<String, dynamic> json) => WithdrawHistoryResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<WithdrawData>.from(json["data"]!.map((x) => WithdrawData.fromJson(x))),
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

class WithdrawData {
  dynamic userId;
  String? id;
  String? ammount;
  String? bankName;
  String? bankAccountNumber;
  String? name;
  String? mobileNumber;
  String? ifscCode;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  WithdrawData({
    this.userId,
    this.id,
    this.ammount,
    this.bankName,
    this.bankAccountNumber,
    this.name,
    this.mobileNumber,
    this.ifscCode,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WithdrawData.fromJson(Map<String, dynamic> json) => WithdrawData(
    userId: json["userId"],
    id: json["_id"],
    ammount: json["ammount"],
    bankName: json["bankName"],
    bankAccountNumber: json["bankAccountNumber"],
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    ifscCode: json["ifscCode"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "_id": id,
    "ammount": ammount,
    "bankName": bankName,
    "bankAccountNumber": bankAccountNumber,
    "name": name,
    "mobileNumber": mobileNumber,
    "ifscCode": ifscCode,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
