import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/lesson_repository.dart';
import '../models/lesson.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository _repository;

  LessonBloc({required LessonRepository repository})
      : _repository = repository,
        super(LessonInitial()) {
    on<LessonEvent>(
      (event, emit) => switch (event) {
        GetLessons() => _getLesson(event, emit),
      },
    );
  }

  void _getLesson(
    GetLessons event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());
    try {
      final lessons = await _repository.getLessons();
      emit(LessonsLoaded(lessons: lessons));
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }
}
