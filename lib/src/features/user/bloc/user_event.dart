part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class GetUser extends UserEvent {}

final class LoginEvent extends UserEvent {
  LoginEvent({required this.auth});

  final Auth auth;
}

final class RegisterEvent extends UserEvent {
  RegisterEvent({required this.auth});

  final Auth auth;
}

final class LogoutEvent extends UserEvent {}
