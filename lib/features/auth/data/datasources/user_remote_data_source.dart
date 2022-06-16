import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rodillo_app/core/error/exceptions.dart';
import 'package:rodillo_app/core/global/environment.dart';
import 'package:rodillo_app/core/services/auth_service.dart';
import 'package:rodillo_app/features/auth/data/models/login_response.dart';
import 'package:rodillo_app/features/auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> userIsLoggedIn();

  Future<UserModel> userLogin({
    required String email,
    required String password,
  });

  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String userName,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.client});
  final _storage = const FlutterSecureStorage();
  final http.Client client;
  final uri = Environment.apiUrl;

  @override
  Future<UserModel> userIsLoggedIn() async {
    final endPoint = Uri.https(uri, 'api/v1/auth/renew');

    final String? token = await AuthService.getToken();

    if (token == null) {
      throw ServerException();
    }

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (response.statusCode == 200) {
      log(response.body);
      final loginResponse = loginResponseFromJson(response.body);
      await _guardarToken(loginResponse.token);
      return loginResponse.user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
  }) async {
    final endPoint = Uri.https(uri, 'api/v1/auth');

    final Map<String, String> data = <String, String>{
      'email': email,
      'password': password,
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await _guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 404) {
      throw EmailException();
    } else if (response.statusCode == 400) {
      throw PasswordException();
    } else if (response.statusCode == 401) {
      throw InactiveException();
    }
    {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String userName,
  }) async {
    final endPoint = Uri.https(uri, '/api/v1/auth/new');

    final data = {
      'email': email,
      'password': password,
      'name': name,
      "lastName": lastName,
      "userName": userName,
    };

    final response = await http.post(endPoint,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await _guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 400) {
      throw RegisterException();
    } else {
      throw ServerException();
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }
}
