import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../models/article.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  static const routePath = '/ArticleScreen';

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: article.title),
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
