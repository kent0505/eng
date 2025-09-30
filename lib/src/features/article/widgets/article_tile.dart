import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/slidable_widget.dart';
import '../bloc/article_bloc.dart';
import '../models/article.dart';
import '../screens/article_screen.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SlidableWidget(
      onDelete: () {
        DialogWidget.show(
          context,
          title: 'Delete Article?',
          confirm: true,
          onPressed: () {
            Slidable.of(context)?.close();
            context.read<ArticleBloc>().add(DeleteArticle(article: article));
            context.pop();
          },
        );
      },
      child: Button(
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
            color: AppColors.tile,
            borderRadius: BorderRadius.circular(Constants.radius),
          ),
          child: Row(
            children: [
              Text(
                article.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: AppFonts.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
