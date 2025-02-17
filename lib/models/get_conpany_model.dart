// To parse this JSON data, do
//
//     final getConpenyResponce = getConpenyResponceFromJson(jsonString);

import 'dart:convert';

GetConpenyResponce getConpenyResponceFromJson(String str) => GetConpenyResponce.fromJson(json.decode(str));

String getConpenyResponceToJson(GetConpenyResponce data) => json.encode(data.toJson());

class GetConpenyResponce {
  bool? success;
  String? message;
  CompanyInfo? data;

  GetConpenyResponce({
    this.success,
    this.message,
    this.data,
  });

  factory GetConpenyResponce.fromJson(Map<String, dynamic> json) => GetConpenyResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : CompanyInfo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class CompanyInfo {
  String? id;
  String? name;
  int? contactNumber;
  String? whatsaapContactNumber;
  String? privacyPolicy;
  String? termsCondition;
  String? icon;
  String? favIcon;
  String? companyTrustProfile;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CompanyInfo({
    this.id,
    this.name,
    this.contactNumber,
    this.whatsaapContactNumber,
    this.privacyPolicy,
    this.termsCondition,
    this.icon,
    this.favIcon,
    this.companyTrustProfile,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
    id: json["_id"],
    name: json["name"],
    contactNumber: json["contactNumber"],
    whatsaapContactNumber: json["whatsaapContactNumber"],
    privacyPolicy: json["privacyPolicy"],
    termsCondition: json["termsCondition"],
    icon: json["icon"],
    favIcon: json["favIcon"],
    companyTrustProfile: json["companyTrustProfile"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "contactNumber": contactNumber,
    "whatsaapContactNumber": whatsaapContactNumber,
    "privacyPolicy": privacyPolicy,
    "termsCondition": termsCondition,
    "icon": icon,
    "favIcon": favIcon,
    "companyTrustProfile": companyTrustProfile,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
