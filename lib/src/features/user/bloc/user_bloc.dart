import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;

  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(UserInitial()) {
    on<UserEvent>(
      (event, emit) => switch (event) {
        GetUser() => _getUser(event, emit),
      },
    );
  }

  void _getUser(
    GetUser event,
    Emitter<UserState> emit,
  ) {
    logger(_repository.runtimeType);
  }
}
