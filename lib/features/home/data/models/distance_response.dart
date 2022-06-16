// To parse this JSON data, do
//
//     final speedResponse = speedResponseFromJson(jsonString);

import 'dart:convert';

DistanceResponse distanceResponseFromJson(String str) =>
    DistanceResponse.fromJson(json.decode(str));

String distanceResponseToJson(DistanceResponse data) =>
    json.encode(data.toJson());

class DistanceResponse {
  DistanceResponse({
    required this.ok,
    required this.distance,
  });

  bool ok;
  double distance;

  factory DistanceResponse.fromJson(Map<String, dynamic> json) =>
      DistanceResponse(
        ok: json["ok"],
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "distance": distance,
      };
}
