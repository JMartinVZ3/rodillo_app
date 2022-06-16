import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rodillo_app/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:rodillo_app/features/auth/data/repositories/user_repository_impl.dart';
import 'package:rodillo_app/features/auth/domain/repositories/user_repository.dart';
import 'package:rodillo_app/features/auth/domain/usecases/user_is_logged_in.dart';
import 'package:rodillo_app/features/auth/domain/usecases/user_login.dart';
import 'package:rodillo_app/features/auth/domain/usecases/user_register.dart';
import 'package:rodillo_app/features/home/data/datasource/metrics_data_source.dart';
import 'package:rodillo_app/features/home/data/repositories/metrics_repository_impl.dart';
import 'package:rodillo_app/features/home/domain/repositories/metrics_repository.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_calories.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_distance.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_rpm.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_speed.dart';
import 'package:rodillo_app/features/home/domain/usecases/get_time.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features

  //! Usecases
  //* Users
  sl.registerLazySingleton(() => UserIsLoggedIn(sl()));
  sl.registerLazySingleton(() => UserLogin(sl()));
  sl.registerLazySingleton(() => UserRegister(sl()));

  //* Metrics
  sl.registerLazySingleton(() => GetCalories(sl()));
  sl.registerLazySingleton(() => GetTime(sl()));
  sl.registerLazySingleton(() => GetSpeed(sl()));
  sl.registerLazySingleton(() => GetDistance(sl()));
  sl.registerLazySingleton(() => GetRpm(sl()));

  //! Repository
  //* Users
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));

  //* Metrics
  sl.registerLazySingleton<MetricsRepository>(
      () => MetricsRepositoryImpl(remoteDataSource: sl()));

  //! Datasources
  //* Users
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //* Metrics
  sl.registerLazySingleton<MetricsRemoteDataSource>(
      () => MetricsRemoteDataSourceImpl(client: sl()));

  //! External
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
