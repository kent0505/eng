import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../article/screens/articles_screen.dart';
import '../../lesson/screens/lessons_screen.dart';
import '../../listening/screens/listening_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../word/screens/words_screen.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Constants.padding),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            HomeTile(
              title: 'Lessons',
              onPressed: () {
                context.push(LessonsScreen.routePath);
              },
            ),
            HomeTile(
              title: 'Words',
              onPressed: () {
                context.push(WordsScreen.routePath);
              },
            ),
            HomeTile(
              title: 'Words Puzzle',
              onPressed: () {},
            ),
            HomeTile(
              title: 'Sentences Puzzle',
              onPressed: () {},
            ),
            HomeTile(
              title: 'Articles',
              onPressed: () {
                context.push(ArticlesScreen.routePath);
              },
            ),
            HomeTile(
              title: 'Listening',
              onPressed: () {
                context.push(ListeningScreen.routePath);
              },
            ),
            HomeTile(
              title: 'Settings',
              onPressed: () {
                context.push(SettingsScreen.routePath);
              },
            ),
          ],
        ),
      ),
    );
  }
}
