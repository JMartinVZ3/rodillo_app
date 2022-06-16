import 'package:dartz/dartz.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> userIsLoggedIn();
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> userRegister({
    required String email,
    required String password,
    required String name,
    required String userName,
    required String lastName,
  });
}
