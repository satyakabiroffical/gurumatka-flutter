// To parse this JSON data, do
//
//     final otpVerifyResponce = otpVerifyResponceFromJson(jsonString);

import 'dart:convert';

OtpVerifyResponce otpVerifyResponceFromJson(String str) => OtpVerifyResponce.fromJson(json.decode(str));

String otpVerifyResponceToJson(OtpVerifyResponce data) => json.encode(data.toJson());

class OtpVerifyResponce {
  bool? success;
  String? message;
  Data? data;

  OtpVerifyResponce({
    this.success,
    this.message,
    this.data,
  });

  factory OtpVerifyResponce.fromJson(Map<String, dynamic> json) => OtpVerifyResponce(
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
  User? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}


class User {
  String? id;
  int? phoneNumber;
  String? otp;
  int? walletBalance;
  int? totalPeopleAdded;
  int? totalCommission;
  String? userType;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? image;
  String? address;
  String? dob;
  String? email;
  String? gender;
  String? userName;
  String? token;
  String? referenceCode;

  User({
    this.id,
    this.phoneNumber,
    this.otp,
    this.walletBalance,
    this.totalPeopleAdded,
    this.totalCommission,
    this.userType,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.address,
    this.dob,
    this.email,
    this.gender,
    this.userName,
    this.token,
    this.referenceCode
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    phoneNumber: json["phoneNumber"],
    otp: json["otp"],
    walletBalance: json["walletBalance"],
    totalPeopleAdded: json["totalPeopleAdded"],
    totalCommission: json["totalCommission"],
    userType: json["userType"],
    disable: json["disable"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    image: json["image"],
    address: json["address"],
    dob: json["dob"],
    email: json["email"],
    gender: json["gender"],
    userName: json["userName"],
    token: json["token"],
    referenceCode: json["referenceCode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phoneNumber": phoneNumber,
    "otp": otp,
    "walletBalance": walletBalance,
    "totalPeopleAdded": totalPeopleAdded,
    "totalCommission": totalCommission,
    "userType": userType,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "image": image,
    "address": address,
    "dob": dob,
    "email": email,
    "gender": gender,
    "userName": userName,
    "token": token,
    'referenceCode':referenceCode
  };
}

