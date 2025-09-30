import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/err.dart';
import '../../../core/widgets/loading_widget.dart';
import '../bloc/article_bloc.dart';
import '../widgets/article_tile.dart';
import 'article_edit_screen.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  static const routePath = '/ArticlesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Articles',
        right: Button(
          onPressed: () {
            context.push(
              ArticleEditScreen.routePath,
              extra: null,
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const LoadingWidget();
          }

          if (state is ArticlesLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ArticleTile(article: state.articles[index]);
              },
            );
          }

          if (state is ArticleError) {
            return Err(
              error: state.error,
              onReload: () {
                context.read<ArticleBloc>().add(GetArticles());
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
