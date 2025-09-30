import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../article/bloc/article_bloc.dart';
import '../../article/screens/articles_screen.dart';
import '../../lesson/bloc/lesson_bloc.dart';
import '../../lesson/screens/lessons_screen.dart';
import '../../listening/screens/listening_screen.dart';
import '../../sentence/pages/sentence_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../word/bloc/word_bloc.dart';
import '../../word/screens/words_screen.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getData() async {
    context.read<LessonBloc>().add(GetLessons());
    context.read<WordBloc>().add(GetWords());
    context.read<ArticleBloc>().add(GetArticles());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = context.watch<LessonBloc>().state;
    final wordState = context.watch<WordBloc>().state;
    final articleState = context.watch<ArticleBloc>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: RefreshIndicator(
        onRefresh: getData,
        child: ListView(
          padding: const EdgeInsets.all(Constants.padding),
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                HomeTile(
                  title: 'Lessons',
                  asset: Assets.lessons,
                  amount: lessonState is LessonsLoaded
                      ? lessonState.lessons.length
                      : null,
                  loading: lessonState is LessonsLoading,
                  onPressed: () {
                    context.push(LessonsScreen.routePath);
                  },
                ),
                HomeTile(
                  title: 'Words',
                  asset: Assets.words,
                  amount:
                      wordState is WordsLoaded ? wordState.words.length : null,
                  loading: wordState is WordsLoading,
                  onPressed: () {
                    context.push(WordsScreen.routePath);
                  },
                ),
                HomeTile(
                  title: 'Words Puzzle',
                  asset: Assets.wordsPuzzle,
                  onPressed: () {},
                ),
                HomeTile(
                  title: 'Sentences Puzzle',
                  asset: Assets.sentences,
                  onPressed: () {
                    context.push(SentenceScreen.routePath);
                  },
                ),
                HomeTile(
                  title: 'Articles',
                  asset: Assets.articles,
                  amount: articleState is ArticlesLoaded
                      ? articleState.articles.length
                      : null,
                  loading: articleState is ArticlesLoading,
                  onPressed: () {
                    context.push(ArticlesScreen.routePath);
                  },
                ),
                HomeTile(
                  title: 'Listening',
                  asset: Assets.listening,
                  onPressed: () {
                    context.push(ListeningScreen.routePath);
                  },
                ),
                HomeTile(
                  title: 'Settings',
                  asset: Assets.settings,
                  onPressed: () {
                    context.push(SettingsScreen.routePath);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
