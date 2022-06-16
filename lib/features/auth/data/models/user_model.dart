import 'dart:convert';

import 'package:rodillo_app/features/auth/domain/entities/user.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required String id,
    required String name,
    required String email,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userName,
    required String lastName,
  }) : super(
          id: id,
          name: name,
          email: email,
          createdAt: createdAt,
          updatedAt: updatedAt,
          userName: userName,
          lastName: lastName,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        userName: json["userName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
        "userName": userName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
