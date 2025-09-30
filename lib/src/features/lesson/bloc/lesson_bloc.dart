import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/lesson_repository.dart';
import '../models/lesson.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository _repository;

  LessonBloc(LessonRepository repository)
      : _repository = repository,
        super(LessonInitial()) {
    on<LessonEvent>(
      (event, emit) => switch (event) {
        GetLessons() => _getLesson(event, emit),
        AddLesson() => _addLesson(event, emit),
        EditLesson() => _editLesson(event, emit),
        DeleteLesson() => _deleteLesson(event, emit),
      },
    );
  }

  void _getLesson(
    GetLessons event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonsLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      final lessons = await _repository.getLessons();

      emit(LessonsLoaded(lessons: lessons));
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  void _addLesson(
    AddLesson event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonsLoading());
    try {
      await _repository.addLesson(event.lesson);

      add(GetLessons());
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  void _editLesson(
    EditLesson event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonsLoading());
    try {
      await _repository.editLesson(event.lesson);

      add(GetLessons());
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  void _deleteLesson(
    DeleteLesson event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonsLoading());
    try {
      await _repository.deleteLesson(event.lesson);

      add(GetLessons());
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }
}
