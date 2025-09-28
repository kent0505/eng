import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/article_repository.dart';
import '../models/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _repository;

  ArticleBloc({required ArticleRepository repository})
      : _repository = repository,
        super(ArticleInitial()) {
    on<ArticleEvent>(
      (event, emit) => switch (event) {
        GetArticles() => _getArticles(event, emit),
      },
    );
  }

  void _getArticles(
    GetArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticlesLoading());
    try {
      final articles = await _repository.getArticles();
      emit(ArticlesLoaded(articles: articles));
    } catch (e) {
      logger(e);
      emit(ArticleError(error: e.toString()));
    }
  }
}
