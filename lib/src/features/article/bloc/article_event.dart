part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

final class GetArticles extends ArticleEvent {}

final class AddArticle extends ArticleEvent {
  AddArticle({required this.article});

  final Article article;
}

final class EditArticle extends ArticleEvent {
  EditArticle({required this.article});

  final Article article;
}

final class DeleteArticle extends ArticleEvent {
  DeleteArticle({required this.article});

  final Article article;
}
