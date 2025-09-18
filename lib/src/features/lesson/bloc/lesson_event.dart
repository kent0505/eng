part of 'lesson_bloc.dart';

@immutable
sealed class LessonEvent {}

final class GetLessons extends LessonEvent {}

final class AddLesson extends LessonEvent {
  AddLesson({required this.lesson});

  final Lesson lesson;
}

final class EditLesson extends LessonEvent {
  EditLesson({required this.lesson});

  final Lesson lesson;
}

final class DeleteLesson extends LessonEvent {
  DeleteLesson({required this.lesson});

  final Lesson lesson;
}
