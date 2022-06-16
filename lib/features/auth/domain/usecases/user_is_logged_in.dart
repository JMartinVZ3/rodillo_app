import 'package:dartz/dartz.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/core/usecases/usecase.dart';
import 'package:rodillo_app/features/auth/domain/entities/user.dart';
import 'package:rodillo_app/features/auth/domain/repositories/user_repository.dart';

class UserIsLoggedIn implements UseCase<User, NoParams> {
  final UserRepository repository;

  UserIsLoggedIn(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.userIsLoggedIn();
  }
}
