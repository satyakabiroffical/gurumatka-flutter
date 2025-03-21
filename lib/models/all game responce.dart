// To parse this JSON data, do
//
//     final allGameResponce = allGameResponceFromJson(jsonString);

import 'dart:convert';

import 'package:guru_matka_new/models/gameModel.dart';

AllGameResponce allGameResponceFromJson(String str) => AllGameResponce.fromJson(json.decode(str));

String allGameResponceToJson(AllGameResponce data) => json.encode(data.toJson());

class AllGameResponce {
  bool? success;
  String? message;
  List<Game>? data;
  int? totalPages;
  int? currentPage;

  AllGameResponce({
    this.success,
    this.message,
    this.data,
    this.totalPages,
    this.currentPage,
  });

  factory AllGameResponce.fromJson(Map<String, dynamic> json) => AllGameResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] != null && json["data"] is List
        ? List<Game>.from((json["data"] as List).map((item) => Game.fromJson(item as Map<String, dynamic>)))
        : [],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "totalPages": totalPages,
    "currentPage": currentPage,
  };
}


