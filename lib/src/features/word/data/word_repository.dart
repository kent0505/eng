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
    final response = await _dio.get('/api/v1/client/words');

    if (response.statusCode == 200) {
      List data = response.data['words'];

      List<Word> words = data.map((json) {
        return Word.fromJson(json);
      }).toList();

      return words;
    }

    throw exception(response);
  }
}
