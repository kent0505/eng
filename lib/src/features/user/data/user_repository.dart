import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../models/login.dart';
import '../models/user.dart';

abstract interface class UserRepository {
  const UserRepository();

  Future<User> getUser();
  Future<void> login(Auth auth);
  Future<void> register(Auth auth);
  Future<void> logout();
}

final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required SharedPreferences prefs,
    required Dio dio,
  })  : _prefs = prefs,
        _dio = dio;

  final SharedPreferences _prefs;
  final Dio _dio;

  @override
  Future<User> getUser() async {
    final response = await _dio.get('/api/v1/user/');

    if (response.statusCode == 200) {
      return User.fromJson(response.data['user']);
    }

    throw exception(response);
  }

  @override
  Future<void> login(Auth auth) async {
    final response = await _dio.post(
      '/api/v1/auth/login',
      data: {
        'username': auth.username,
        'password': auth.password,
      },
    );

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> register(Auth auth) async {
    final response = await _dio.post(
      '/api/v1/auth/register',
      data: {
        'username': auth.username,
        'password': auth.password,
      },
    );

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> logout() async {
    await _prefs.remove(Keys.token);
  }
}
