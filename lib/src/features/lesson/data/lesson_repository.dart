import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../../lesson/models/lesson.dart';

abstract interface class LessonRepository {
  const LessonRepository();

  Future<List<Lesson>> getLessons();
}

final class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Lesson>> getLessons() async {
    final response = await _dio.get('/api/v1/client/lessons');

    if (response.statusCode == 200) {
      List data = response.data['lessons'];

      List<Lesson> lessons = data.map((json) {
        return Lesson.fromJson(json);
      }).toList();

      return lessons;
    }

    throw exception(response);
  }
}
