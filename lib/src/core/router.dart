import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';
import '../features/lesson/models/lesson.dart';
import '../features/lesson/screens/lesson_edit_screen.dart';
import '../features/lesson/screens/lesson_screen.dart';
import '../features/splash/screens/splash_screen.dart';

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
  ],
);
