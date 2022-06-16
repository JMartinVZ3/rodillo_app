// To parse this JSON data, do
//
//     final caloriesResponse = caloriesResponseFromJson(jsonString);

import 'dart:convert';

CaloriesResponse caloriesResponseFromJson(String str) =>
    CaloriesResponse.fromJson(json.decode(str));

String caloriesResponseToJson(CaloriesResponse data) =>
    json.encode(data.toJson());

class CaloriesResponse {
  CaloriesResponse({
    required this.ok,
    required this.calories,
  });

  bool ok;
  double calories;

  factory CaloriesResponse.fromJson(Map<String, dynamic> json) =>
      CaloriesResponse(
        ok: json["ok"],
        calories: json["calories"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "calories": calories,
      };
}
