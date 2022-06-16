// To parse this JSON data, do
//
//     final timeResponse = timeResponseFromJson(jsonString);

import 'dart:convert';

TimeResponse timeResponseFromJson(String str) =>
    TimeResponse.fromJson(json.decode(str));

String timeResponseToJson(TimeResponse data) => json.encode(data.toJson());

class TimeResponse {
  TimeResponse({
    required this.ok,
    required this.time,
  });

  bool ok;
  double time;

  factory TimeResponse.fromJson(Map<String, dynamic> json) => TimeResponse(
        ok: json["ok"],
        time: json["time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "time": time,
      };
}
