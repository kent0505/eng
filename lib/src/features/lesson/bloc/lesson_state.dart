part of 'lesson_bloc.dart';

@immutable
sealed class LessonState {}

final class LessonInitial extends LessonState {}

final class LessonsLoading extends LessonState {}

final class LessonsLoaded extends LessonState {
  LessonsLoaded({required this.lessons});

  final List<Lesson> lessons;
}

final class LessonError extends LessonState {
  LessonError({required this.error});

  final String error;
}
