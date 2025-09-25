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
        UserLogin() => _userLogin(event, emit),
        UserRegister() => _userRegister(event, emit),
      },
    );
  }

  void _getUser(
    GetUser event,
    Emitter<UserState> emit,
  ) async {
    logger(_repository.runtimeType);
  }

  void _userLogin(
    UserLogin event,
    Emitter<UserState> emit,
  ) async {}

  void _userRegister(
    UserRegister event,
    Emitter<UserState> emit,
  ) async {}
}
