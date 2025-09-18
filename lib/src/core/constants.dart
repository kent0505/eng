import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color accent = Colors.greenAccent;
  static const Color error = Colors.redAccent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color bg = Color(0xffF2F5F8);
  static const Color overScroll = Color(0xffd5d5d5);
  static const Color hintColor = Color(0xff707883);
}

abstract final class AppFonts {
  static const String w400 = 'w400';
  static const String w500 = 'w500';
  static const String w600 = 'w600';
  static const String w700 = 'w700';
}

abstract final class Constants {
  static const double appBarHeight = 60;
  static const double navBarHeight = 62;
  static const double padding = 16;
  static const double radius = 10;
}

abstract final class Assets {
  static const String back = 'assets/back.svg';
  static const String home1 = 'assets/home1.svg';
  static const String home2 = 'assets/home2.svg';
  static const String profile1 = 'assets/profile1.svg';
  static const String profile2 = 'assets/profile2.svg';
}

abstract final class Keys {
  static const String onboard = 'onboard';
  static const String token = 'token';
}

// abstract final class Roles {
//   static const String admin = "admin";
//   static const String user = "user";
// }

enum Roles { admin, user }

// final colors = Theme.of(context).extension<MyColors>()!;

/* 
abstract interface class OnboardRepository {
  const OnboardRepository();

  Future<void> removeOnboard();
}

final class OnboardRepositoryImpl implements OnboardRepository {
  OnboardRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<void> removeOnboard() async {}
}
*/

/*
class TestBloc extends Bloc<TestEvent, TestState> {
  final TestRepository _repository;

  TestBloc({required TestRepository repository})
      : _repository = repository,
        super(TestInitial()) {
    on<TestEvent>(
      (event, emit) => switch (event) {
        LoadTest() => _loadTest(event, emit),
      },
    );
  }

  void _loadTest(
    LoadTest event,
    Emitter<TestState> emit,
  ) {
    logger(_repository.isTest());
  }
}
*/
