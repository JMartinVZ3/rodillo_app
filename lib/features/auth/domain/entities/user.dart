import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String userName;
  final String lastName;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        userName,
        lastName,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => false;
}
