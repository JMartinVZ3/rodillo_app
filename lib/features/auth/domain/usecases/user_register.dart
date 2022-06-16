import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/core/usecases/usecase.dart';
import 'package:rodillo_app/features/auth/domain/entities/user.dart';
import 'package:rodillo_app/features/auth/domain/repositories/user_repository.dart';

class UserRegister implements UseCase<User, UserRegisterParams> {
  final UserRepository repository;

  UserRegister(this.repository);

  @override
  Future<Either<Failure, User>> call(UserRegisterParams params) async {
    return await repository.userRegister(
      email: params.email,
      password: params.password,
      name: params.name,
      lastName: params.lastName,
      userName: params.userName,
    );
  }
}

class UserRegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String userName;
  final String lastName;

  const UserRegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.userName,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        lastName,
        userName,
      ];

  @override
  bool get stringify => false;
}
