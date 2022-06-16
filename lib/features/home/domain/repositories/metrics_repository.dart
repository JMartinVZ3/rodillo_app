import 'package:dartz/dartz.dart';
import 'package:rodillo_app/core/error/failure.dart';

abstract class MetricsRepository {
  Future<Either<Failure, double>> getCalories();
  Future<Either<Failure, double>> getTime();
  Future<Either<Failure, double>> getDistance();
  Future<Either<Failure, double>> getSpeed();
  Future<Either<Failure, double>> getRpm();
}
