part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticlesLoading extends ArticleState {}

final class ArticlesLoaded extends ArticleState {
  ArticlesLoaded({required this.articles});

  final List<Article> articles;
}

final class ArticleError extends ArticleState {
  ArticleError({required this.error});

  final String error;
}
