import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/article_repository.dart';
import '../models/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _repository;

  ArticleBloc(ArticleRepository repository)
      : _repository = repository,
        super(ArticleInitial()) {
    on<ArticleEvent>(
      (event, emit) => switch (event) {
        GetArticles() => _getArticles(event, emit),
        AddArticle() => _addArticle(event, emit),
        EditArticle() => _editArticle(event, emit),
        DeleteArticle() => _deleteArticle(event, emit),
      },
    );
  }

  void _getArticles(
    GetArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticlesLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      final articles = await _repository.getArticles();

      emit(ArticlesLoaded(articles: articles));
    } catch (e) {
      logger(e);
      emit(ArticleError(error: e.toString()));
    }
  }

  void _addArticle(
    AddArticle event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticlesLoading());
    try {
      await _repository.addArticle(event.article);

      add(GetArticles());
    } catch (e) {
      logger(e);
      emit(ArticleError(error: e.toString()));
    }
  }

  void _editArticle(
    EditArticle event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticlesLoading());
    try {
      await _repository.editArticle(event.article);

      add(GetArticles());
    } catch (e) {
      logger(e);
      emit(ArticleError(error: e.toString()));
    }
  }

  void _deleteArticle(
    DeleteArticle event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticlesLoading());
    try {
      await _repository.deleteArticle(event.article);

      add(GetArticles());
    } catch (e) {
      logger(e);
      emit(ArticleError(error: e.toString()));
    }
  }
}
