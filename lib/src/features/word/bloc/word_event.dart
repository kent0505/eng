part of 'word_bloc.dart';

@immutable
sealed class WordEvent {}

final class GetWords extends WordEvent {}
