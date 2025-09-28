import 'package:go_router/go_router.dart';

import '../features/article/models/article.dart';
import '../features/article/screens/article_screen.dart';
import '../features/article/screens/articles_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/lesson/models/lesson.dart';
import '../features/lesson/screens/lesson_edit_screen.dart';
import '../features/lesson/screens/lesson_screen.dart';
import '../features/lesson/screens/lessons_screen.dart';
import '../features/listening/screens/listening_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import '../features/splash/screens/splash_screen.dart';
import '../features/user/screens/login_screen.dart';
import '../features/word/screens/words_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),

    // lesson
    GoRoute(
      path: LessonsScreen.routePath,
      builder: (context, state) => const LessonsScreen(),
    ),
    GoRoute(
      path: LessonScreen.routePath,
      builder: (context, state) => LessonScreen(
        lesson: state.extra as Lesson,
      ),
    ),
    GoRoute(
      path: LessonEditScreen.routePath,
      builder: (context, state) => LessonEditScreen(
        lesson: state.extra as Lesson?,
      ),
    ),

    // word
    GoRoute(
      path: WordsScreen.routePath,
      builder: (context, state) => const WordsScreen(),
    ),

    // article
    GoRoute(
      path: ArticlesScreen.routePath,
      builder: (context, state) => const ArticlesScreen(),
    ),
    GoRoute(
      path: ArticleScreen.routePath,
      builder: (context, state) => ArticleScreen(
        article: state.extra as Article,
      ),
    ),

    // listening
    GoRoute(
      path: ListeningScreen.routePath,
      builder: (context, state) => const ListeningScreen(),
    ),

    // settings
    GoRoute(
      path: SettingsScreen.routePath,
      builder: (context, state) => const SettingsScreen(),
    ),

    //
    GoRoute(
      path: AuthScreen.routePath,
      builder: (context, state) => const AuthScreen(),
    ),
  ],
);
