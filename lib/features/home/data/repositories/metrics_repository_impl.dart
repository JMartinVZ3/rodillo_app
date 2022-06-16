import 'package:dartz/dartz.dart';
import 'package:rodillo_app/core/error/exceptions.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/features/home/data/datasource/metrics_data_source.dart';
import 'package:rodillo_app/features/home/domain/repositories/metrics_repository.dart';

class MetricsRepositoryImpl implements MetricsRepository {
  final MetricsRemoteDataSource remoteDataSource;

  MetricsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, double>> getCalories() async {
    try {
      final remoteUser = await remoteDataSource.getCalories();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getDistance() async {
    try {
      final remoteUser = await remoteDataSource.getDistance();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getRpm() async {
    try {
      final remoteUser = await remoteDataSource.getRpm();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getSpeed() async {
    try {
      final remoteUser = await remoteDataSource.getSpeed();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getTime() async {
    try {
      final remoteUser = await remoteDataSource.getTime();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
