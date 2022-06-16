// To parse this JSON data, do
//
//     final humidityResponse = humidityResponseFromJson(jsonString);

import 'dart:convert';

HumidityResponse humidityResponseFromJson(String str) =>
    HumidityResponse.fromJson(json.decode(str));

String humidityResponseToJson(HumidityResponse data) =>
    json.encode(data.toJson());

class HumidityResponse {
  HumidityResponse({
    required this.ok,
    required this.humidity,
  });

  bool ok;
  Humidity humidity;

  factory HumidityResponse.fromJson(Map<String, dynamic> json) =>
      HumidityResponse(
        ok: json["ok"],
        humidity: Humidity.fromJson(json["humidity"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "humidity": humidity.toJson(),
      };
}

class Humidity {
  Humidity({
    required this.id,
    required this.humidity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  int humidity;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Humidity.fromJson(Map<String, dynamic> json) => Humidity(
        id: json["_id"],
        humidity: json["humidity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "humidity": humidity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
