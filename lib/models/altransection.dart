// To parse this JSON data, do
//
//     final allTransection = allTransectionFromJson(jsonString);

import 'dart:convert';

AllTransectionResponce allTransectionFromJson(String str) => AllTransectionResponce.fromJson(json.decode(str));

String allTransectionToJson(AllTransectionResponce data) => json.encode(data.toJson());

class AllTransectionResponce {
  bool? success;
  String? message;
  List<AllTransection>? data;
  int? totalResults;
  int? page;
  int? currentPage;

  AllTransectionResponce({
    this.success,
    this.message,
    this.data,
    this.totalResults,
    this.page,
    this.currentPage,
  });

  factory AllTransectionResponce.fromJson(Map<String, dynamic> json) => AllTransectionResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AllTransection>.from(json["data"]!.map((x) => AllTransection.fromJson(x))),
    totalResults: json["totalResults"],
    page: json["page"],
    currentPage: json["currentPage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "totalResults": totalResults,
    "page": page,
    "currentPage": currentPage,
  };
}

class AllTransection {
  String? id;
  int? amount;
  String? transactionId;
  String? ss;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? ammount;
  String? bankName;
  String? bankAccountNumber;
  String? name;
  String? mobileNumber;
  String? ifscCode;

  AllTransection({
    this.id,
    this.amount,
    this.transactionId,
    this.ss,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ammount,
    this.bankName,
    this.bankAccountNumber,
    this.name,
    this.mobileNumber,
    this.ifscCode,
  });

  factory AllTransection.fromJson(Map<String, dynamic> json) => AllTransection(
    id: json["_id"],
    amount: json["amount"],
    transactionId: json["transactionId"],
    ss: json["ss"],
    status: json["status"],
    userId: json["userId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    ammount: json["ammount"],
    bankName: json["bankName"],
    bankAccountNumber: json["bankAccountNumber"],
    name: json["name"],
    mobileNumber: json["mobileNumber"],
    ifscCode: json["ifscCode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "amount": amount,
    "transactionId": transactionId,
    "ss": ss,
    "status": status,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "ammount": ammount,
    "bankName": bankName,
    "bankAccountNumber": bankAccountNumber,
    "name": name,
    "mobileNumber": mobileNumber,
    "ifscCode": ifscCode,
  };
}
