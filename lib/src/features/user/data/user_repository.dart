import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class UserRepository {
  const UserRepository();

  Future<void> clear();
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
  Future<void> clear() async {
    await _prefs.clear();
    _dio.toString();
  }
}
