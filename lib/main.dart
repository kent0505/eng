import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'src/core/constants.dart';
import 'src/core/router.dart';
import 'src/core/themes.dart';
import 'src/features/article/bloc/article_bloc.dart';
import 'src/features/article/data/article_repository.dart';
import 'src/features/lesson/bloc/lesson_bloc.dart';
import 'src/features/lesson/data/lesson_repository.dart';
import 'src/features/user/bloc/user_bloc.dart';
import 'src/features/user/data/user_repository.dart';
import 'src/features/word/bloc/word_bloc.dart';
import 'src/features/word/data/word_repository.dart';

// adb tcpip 5555
// adb connect 192.168.0.191
// adb reverse tcp:8000 tcp:8000

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: '.env');

  final prefs = await SharedPreferences.getInstance();

  final baseUrl = dotenv.env['BASE_URL'] ?? '';
  final apiKey = dotenv.env['API_KEY'] ?? '';
  final token = prefs.getString(Keys.token) ?? '';
  const timeout = Duration(seconds: 10);

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
      validateStatus: (status) => true,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'api-key': apiKey,
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
        RepositoryProvider<WordRepository>(
          create: (context) => WordRepositoryImpl(dio: dio),
        ),
        RepositoryProvider<ArticleRepository>(
          create: (context) => ArticleRepositoryImpl(dio: dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => LessonBloc(context.read<LessonRepository>()),
          ),
          BlocProvider(
            create: (context) => WordBloc(context.read<WordRepository>()),
          ),
          BlocProvider(
            create: (context) => ArticleBloc(context.read<ArticleRepository>()),
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
