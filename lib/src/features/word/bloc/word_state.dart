part of 'word_bloc.dart';

@immutable
sealed class WordState {}

final class WordInitial extends WordState {}

final class WordsLoading extends WordState {}

final class WordsLoaded extends WordState {
  WordsLoaded({required this.words});

  final List<Word> words;
}

final class WordError extends WordState {
  WordError({required this.error});

  final String error;
}
