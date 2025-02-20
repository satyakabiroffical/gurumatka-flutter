// To parse this JSON data, do
//
//     final transectionHistoryResponce = transectionHistoryResponceFromJson(jsonString);

import 'dart:convert';

import 'package:guru_matka_new/models/verifyOTpREsponce.dart';

TransectionHistoryResponce transectionHistoryResponceFromJson(String str) => TransectionHistoryResponce.fromJson(json.decode(str));

String transectionHistoryResponceToJson(TransectionHistoryResponce data) => json.encode(data.toJson());

class TransectionHistoryResponce {
  bool? success;
  String? message;
  List<Transaction>? data;
  int? page;
  int? currentPage;

  TransectionHistoryResponce({
    this.success,
    this.message,
    this.data,
    this.page,
    this.currentPage,
  });

  factory TransectionHistoryResponce.fromJson(Map<String, dynamic> json) => TransectionHistoryResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Transaction>.from(json["data"]!.map((x) => Transaction.fromJson(x))),
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

class Transaction {
  String? id;
  int? amount;
  String? transactionId;
  String? ss;
  String? status;
  User? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Transaction({
    this.id,
    this.amount,
    this.transactionId,
    this.ss,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["_id"],
    amount: json["amount"],
    transactionId: json["transactionId"],
    ss: json["ss"],
    status: json["status"],
    userId: json["userId"] == null ? null : User.fromJson(json["userId"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "amount": amount,
    "transactionId": transactionId,
    "ss": ss,
    "status": status,
    "userId": userId?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}


