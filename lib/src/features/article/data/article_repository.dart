import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../models/article.dart';

abstract interface class ArticleRepository {
  const ArticleRepository();

  Future<List<Article>> getArticles();
}

final class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Article>> getArticles() async {
    final response = await _dio.get('/api/v1/client/articles');

    if (response.statusCode == 200) {
      List data = response.data['articles'];

      List<Article> articles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      return articles;
    }

    throw exception(response);
  }
}
