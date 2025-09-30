import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../models/article.dart';
import 'article_edit_screen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  static const routePath = '/ArticleScreen';

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: article.title,
        right: Button(
          onPressed: () {
            context.push(
              ArticleEditScreen.routePath,
              extra: article,
            );
          },
          minSize: 60,
          child: const Icon(
            Icons.edit_rounded,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: MarkdownBody(
          data: article.data,
          styleSheet: MarkdownStyleSheet(
            p: const TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
            ),
            strong: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
