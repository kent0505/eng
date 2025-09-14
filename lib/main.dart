import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'src/core/constants.dart';
import 'src/core/router.dart';
import 'src/core/themes.dart';
import 'src/features/lesson/bloc/lesson_bloc.dart';
import 'src/features/lesson/data/lesson_repository.dart';
import 'src/features/user/bloc/user_bloc.dart';
import 'src/features/user/data/user_repository.dart';
import 'src/features/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: ".env");

  final prefs = await SharedPreferences.getInstance();

  final baseUrl = dotenv.env['BASE_URL'] ?? '';
  final token = prefs.getString(Keys.token) ?? dotenv.env['TOKEN'] ?? '';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      validateStatus: (status) => true,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ),
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            prefs: prefs,
            dio: dio,
          ),
        ),
        RepositoryProvider<LessonRepository>(
          create: (context) => LessonRepositoryImpl(dio: dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(
            create: (context) => UserBloc(
              repository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LessonBloc(
              repository: context.read<LessonRepository>(),
            )..add(GetLessons()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: routerConfig,
        ),
      ),
    ),
  );
}
