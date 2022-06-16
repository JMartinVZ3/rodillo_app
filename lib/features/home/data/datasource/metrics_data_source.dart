import 'package:http/http.dart' as http;
import 'package:rodillo_app/core/error/exceptions.dart';
import 'package:rodillo_app/core/global/environment.dart';
import 'package:rodillo_app/features/home/data/models/calories_response.dart';
import 'package:rodillo_app/features/home/data/models/distance_response.dart';
import 'package:rodillo_app/features/home/data/models/rpm_response.dart';
import 'package:rodillo_app/features/home/data/models/speed_response.dart';
import 'package:rodillo_app/features/home/data/models/time_response.dart';

abstract class MetricsRemoteDataSource {
  Future<double> getCalories();
  Future<double> getTime();
  Future<double> getDistance();
  Future<double> getSpeed();
  Future<double> getRpm();
}

class MetricsRemoteDataSourceImpl implements MetricsRemoteDataSource {
  MetricsRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final uri = Environment.apiUrl;

  @override
  Future<double> getCalories() async {
    final endPoint = Uri.https(uri, 'api/v1/rpm/calories');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final caloriesResponse = caloriesResponseFromJson(response.body);
      return caloriesResponse.calories;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<double> getDistance() async {
    final endPoint = Uri.https(uri, 'api/v1/rpm/distance');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final distanceResponse = distanceResponseFromJson(response.body);
      return distanceResponse.distance;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<double> getRpm() async {
    final endPoint = Uri.https(uri, 'api/v1/rpm');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final rpmResponse = rpmResponseFromJson(response.body);
      return rpmResponse.rpm.rpm.toDouble();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<double> getSpeed() async {
    final endPoint = Uri.https(uri, 'api/v1/rpm/speed');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final speedResponse = speedResponseFromJson(response.body);
      return speedResponse.speed;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<double> getTime() async {
    final endPoint = Uri.https(uri, 'api/v1/rpm/time');

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final timeResponse = timeResponseFromJson(response.body);
      return timeResponse.time;
    } else {
      throw ServerException();
    }
  }
}
