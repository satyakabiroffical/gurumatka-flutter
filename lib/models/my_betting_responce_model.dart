// To parse this JSON data, do
//
//     final selfPropertyDataModel = selfPropertyDataModelFromJson(jsonString);

import 'dart:convert';

UserBettingResponceModel selfPropertyDataModelFromJson(String str) => UserBettingResponceModel.fromJson(json.decode(str));

String selfPropertyDataModelToJson(UserBettingResponceModel data) => json.encode(data.toJson());

class UserBettingResponceModel {
  bool? success;
  String? message;
  List<MyBettingData>? data;
  int? page;
  String? currentPage;

  UserBettingResponceModel({
    this.success,
    this.message,
    this.data,
    this.page,
    this.currentPage,
  });

  factory UserBettingResponceModel.fromJson(Map<String, dynamic> json) => UserBettingResponceModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<MyBettingData>.from(json["data"]!.map((x) => MyBettingData.fromJson(x))),
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

class MyBettingData {
  String? id;
  String? type;
  String? userId;
  BattingGameId? battingGameId;
  int? jodiTotalAmount;
  List<Crossing>? crossing;
  int? crossingTotalAmount;
  List<Jodi>? jodi;
  List<Haruf>? haruf;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? harufTotalAmount;

  MyBettingData({
    this.id,
    this.type,
    this.userId,
    this.battingGameId,
    this.jodiTotalAmount,
    this.crossing,
    this.crossingTotalAmount,
    this.jodi,
    this.haruf,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.harufTotalAmount,
  });

  factory MyBettingData.fromJson(Map<String, dynamic> json) => MyBettingData(
    id: json["_id"],
    type: json["type"],
    userId:json["userId"],
    battingGameId: json["battingGameID"]==null?null:BattingGameId.fromJson(json['battingGameID']),
    jodiTotalAmount: json["jodiTotalAmount"],
    crossing: json["Crossing"] == null ? [] : List<Crossing>.from(json["Crossing"]!.map((x) => Crossing.fromJson(x))),
    crossingTotalAmount: json["CrossingTotalAmount"],
    jodi: json["jodi"] == null ? [] : List<Jodi>.from(json["jodi"]!.map((x) => Jodi.fromJson(x))),
    haruf: json["haruf"] == null ? [] : List<Haruf>.from(json["haruf"]!.map((x) => Haruf.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    harufTotalAmount: json["harufTotalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type":  type,
    "userId":userId,
    "battingGameID":  battingGameId?.toJson(),
    "jodiTotalAmount": jodiTotalAmount,
    "Crossing": crossing == null ? [] : List<dynamic>.from(crossing!.map((x) => x.toJson())),
    "CrossingTotalAmount": crossingTotalAmount,
    "jodi": jodi == null ? [] : List<dynamic>.from(jodi!.map((x) => x.toJson())),
    "haruf": haruf == null ? [] : List<dynamic>.from(haruf!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "harufTotalAmount": harufTotalAmount,
  };
}


class BattingGameId {
  String? id;
  String? name;

  BattingGameId({
    this.id,
    this.name,
  });

  factory BattingGameId.fromJson(Map<String, dynamic> json) => BattingGameId(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}


class Crossing {
  int? crossingNum;
  int? crossingAmount;
  int? winnigAmount;
  String? id;
  String? status;

  Crossing({
    this.crossingNum,
    this.crossingAmount,
    this.winnigAmount,
    this.id,
    this.status,
  });

  factory Crossing.fromJson(Map<String, dynamic> json) => Crossing(
    crossingNum: json["crossingNum"],
    crossingAmount: json["crossingAmount"],
    id: json["_id"],
    winnigAmount: json["winnigAmount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "crossingNum": crossingNum,
    "crossingAmount": crossingAmount,
    "_id": id,
    "winnigAmount": winnigAmount,
    "status": status,
  };
}

class Haruf {
  List<ArGame>? andarGame;
  List<ArGame>? baharGame;
  String? id;

  Haruf({
    this.andarGame,
    this.baharGame,
    this.id,
  });

  factory Haruf.fromJson(Map<String, dynamic> json) => Haruf(
    andarGame: json["andarGame"] == null ? [] : List<ArGame>.from(json["andarGame"]!.map((x) => ArGame.fromJson(x))),
    baharGame: json["baharGame"] == null ? [] : List<ArGame>.from(json["baharGame"]!.map((x) => ArGame.fromJson(x))),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "andarGame": andarGame == null ? [] : List<dynamic>.from(andarGame!.map((x) => x.toJson())),
    "baharGame": baharGame == null ? [] : List<dynamic>.from(baharGame!.map((x) => x.toJson())),
    "_id": id,
  };
}

class ArGame {
  String? game;
  int? winnningAmount;
  String? status;
  int? harufAmount;
  String? id;

  ArGame({
    this.game,
    this.harufAmount,
    this.winnningAmount,
    this.status,
    this.id,
  });

  factory ArGame.fromJson(Map<String, dynamic> json) => ArGame(
    game: json["game"],
    harufAmount: json["harufAmount"],
    id: json["_id"],
    winnningAmount: json["winnigAmount"],
    status: json["status"],

  );

  Map<String, dynamic> toJson() => {
    "game": game,
    "harufAmount": harufAmount,
    "_id": id,
    "winnigAmount": winnningAmount,
    "status": status,
  };
}

class Jodi {
  int? jodiNum;
  int? winnigAmount;
  int? price;
  String? id;
  String? status;

  Jodi({
    this.jodiNum,
    this.price,
    this.winnigAmount,
    this.id,
    this.status,
  });

  factory Jodi.fromJson(Map<String, dynamic> json) => Jodi(
    jodiNum: json["jodiNum"],
    price: json["price"],
    id: json["_id"],
    winnigAmount: json["winnigAmount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "jodiNum": jodiNum,
    "price": price,
    "_id": id,
    "winnigAmount": winnigAmount,
    "status": status,
  };
}


