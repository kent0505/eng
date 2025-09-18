import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../../lesson/models/lesson.dart';

abstract interface class LessonRepository {
  const LessonRepository();

  Future<List<Lesson>> getLessons();
  Future<void> addLesson(Lesson lesson);
  Future<void> editLesson(Lesson lesson);
  Future<void> deleteLesson(Lesson lesson);
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

  @override
  Future<void> addLesson(Lesson lesson) async {
    final response = await _dio.post(
      '/api/v1/lesson/',
      data: {
        'title': lesson.title,
        'content': lesson.content,
      },
    );

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> editLesson(Lesson lesson) async {
    final response = await _dio.put(
      '/api/v1/lesson/?id=${lesson.id}',
      data: {
        'title': lesson.title,
        'content': lesson.content,
      },
    );

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> deleteLesson(Lesson lesson) async {
    final response = await _dio.delete('/api/v1/lesson/?id=${lesson.id}');

    if (response.statusCode == 200) return;

    throw exception(response);
  }
}
