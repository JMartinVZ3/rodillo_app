// To parse this JSON data, do
//
//     final speedResponse = speedResponseFromJson(jsonString);

import 'dart:convert';

SpeedResponse speedResponseFromJson(String str) =>
    SpeedResponse.fromJson(json.decode(str));

String speedResponseToJson(SpeedResponse data) => json.encode(data.toJson());

class SpeedResponse {
  SpeedResponse({
    required this.ok,
    required this.speed,
  });

  bool ok;
  double speed;

  factory SpeedResponse.fromJson(Map<String, dynamic> json) => SpeedResponse(
        ok: json["ok"],
        speed: json["speed"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "speed": speed,
      };
}
