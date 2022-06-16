import 'package:dartz/dartz.dart';
import 'package:rodillo_app/core/error/failure.dart';
import 'package:rodillo_app/core/usecases/usecase.dart';
import 'package:rodillo_app/features/home/domain/repositories/metrics_repository.dart';

class GetDistance implements UseCase<double, NoParams> {
  final MetricsRepository repository;

  GetDistance(this.repository);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    return await repository.getDistance();
  }
}
