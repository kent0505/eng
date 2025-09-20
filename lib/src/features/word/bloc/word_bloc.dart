import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/word_repository.dart';
import '../models/word.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final WordRepository _repository;

  WordBloc({required WordRepository repository})
      : _repository = repository,
        super(WordInitial()) {
    on<WordEvent>(
      (event, emit) => switch (event) {
        GetWords() => _getWords(event, emit),
      },
    );
  }

  void _getWords(
    GetWords event,
    Emitter<WordState> emit,
  ) async {
    emit(WordsLoading());
    try {
      final words = await _repository.getWords();
      emit(WordsLoaded(words: words));
    } catch (e) {
      logger(e);
      emit(WordError(error: e.toString()));
    }
  }
}
