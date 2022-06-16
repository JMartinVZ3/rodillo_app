// To parse this JSON data, do
//
//     final rpmResponse = rpmResponseFromJson(jsonString);

import 'dart:convert';

RpmResponse rpmResponseFromJson(String str) =>
    RpmResponse.fromJson(json.decode(str));

String rpmResponseToJson(RpmResponse data) => json.encode(data.toJson());

class RpmResponse {
  RpmResponse({
    required this.ok,
    required this.rpm,
  });

  bool ok;
  Rpm rpm;

  factory RpmResponse.fromJson(Map<String, dynamic> json) => RpmResponse(
        ok: json["ok"],
        rpm: Rpm.fromJson(json["rpm"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "rpm": rpm.toJson(),
      };
}

class Rpm {
  Rpm({
    required this.id,
    required this.rpm,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  int rpm;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Rpm.fromJson(Map<String, dynamic> json) => Rpm(
        id: json["_id"],
        rpm: json["rpm"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rpm": rpm,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
