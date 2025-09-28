import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/article.dart';
import '../screens/article_screen.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        context.push(
          ArticleScreen.routePath,
          extra: article,
        );
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(
          bottom: 10,
          left: Constants.padding,
          right: Constants.padding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.radius),
        ),
        child: Row(
          children: [
            Text(article.title),
          ],
        ),
      ),
    );
  }
}
