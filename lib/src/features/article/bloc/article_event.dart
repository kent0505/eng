part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

final class GetArticles extends ArticleEvent {}
