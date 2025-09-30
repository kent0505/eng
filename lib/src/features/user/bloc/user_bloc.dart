import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/user_repository.dart';
import '../models/login.dart';
import '../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;

  UserBloc(UserRepository repository)
      : _repository = repository,
        super(UserInitial()) {
    on<UserEvent>(
      (event, emit) => switch (event) {
        GetUser() => _getUser(event, emit),
        LoginEvent() => _loginEvent(event, emit),
        RegisterEvent() => _registerEvent(event, emit),
        LogoutEvent() => _logoutEvent(event, emit),
      },
    );
  }

  void _getUser(
    GetUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final user = await _repository.getUser();

      logger(user.toJson());

      emit(UserLogined(user: user));
    } catch (e) {
      logger(e);
      emit(UserInitial());
    }
  }

  void _loginEvent(
    LoginEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await _repository.login(event.auth);
    } catch (e) {
      logger(e);
    }
  }

  void _registerEvent(
    RegisterEvent event,
    Emitter<UserState> emit,
  ) async {}

  void _logoutEvent(
    LogoutEvent event,
    Emitter<UserState> emit,
  ) async {
    await _repository.logout();
    emit(UserInitial());
  }
}
