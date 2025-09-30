import 'package:dio/dio.dart';

import '../../../core/utils.dart';
import '../models/article.dart';

abstract interface class ArticleRepository {
  const ArticleRepository();

  Future<List<Article>> getArticles();
  Future<void> addArticle(Article article);
  Future<void> editArticle(Article article);
  Future<void> deleteArticle(Article article);
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

  @override
  Future<void> addArticle(Article article) async {
    final response = await _dio.post('/api/v1/article/', data: {
      'title': article.title,
      'data': article.data,
      'cid': article.cid,
    });

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> editArticle(Article article) async {
    final response = await _dio.put('/api/v1/article/?id=${article.id}', data: {
      'title': article.title,
      'data': article.data,
      'cid': article.cid,
    });

    if (response.statusCode == 200) return;

    throw exception(response);
  }

  @override
  Future<void> deleteArticle(Article article) async {
    final response = await _dio.delete('/api/v1/article/?id=${article.id}');

    if (response.statusCode == 200) return;

    throw exception(response);
  }
}
