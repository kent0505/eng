part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class GetUser extends UserEvent {}

final class UserLogin extends UserEvent {}

final class UserRegister extends UserEvent {}
