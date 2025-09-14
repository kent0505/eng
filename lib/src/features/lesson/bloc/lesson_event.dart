part of 'lesson_bloc.dart';

@immutable
sealed class LessonEvent {}

final class GetLessons extends LessonEvent {}
