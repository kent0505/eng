import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../models/word.dart';

abstract interface class WordRepository {
  const WordRepository();

  Future<List<Word>> getWords();
}

final class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Word>> getWords() async {
    final response = await _dio.get(
      '/api/v1/client/words',
      options: Options(responseType: ResponseType.plain),
    );

    if (response.statusCode == 200) {
      final content = response.data as String;
      final lines = content.split('\n');

      return lines.where((line) => line.trim().isNotEmpty).map((line) {
        final parts = line.split(' - ');

        return Word(
          en: parts[0].trim(),
          ru: parts.length > 1 ? parts[1].trim() : '',
        );
      }).toList();
    }

    throw exception(response);
  }
}
