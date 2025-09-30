import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/article_bloc.dart';
import '../models/article.dart';

class ArticleEditScreen extends StatefulWidget {
  const ArticleEditScreen({super.key, required this.article});

  static const routePath = '/ArticleEditScreen';

  final Article? article;

  @override
  State<ArticleEditScreen> createState() => _ArticleEditScreenState();
}

class _ArticleEditScreenState extends State<ArticleEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  late Article article;

  bool active = false;

  void onChanged(String _) {
    setState(() {
      active = [
        titleController,
        contentController,
      ].every((element) => element.text.isNotEmpty);
    });
  }

  void onSave() {
    article.title = titleController.text;
    article.data = contentController.text;

    context.read<ArticleBloc>().add(
          widget.article == null
              ? AddArticle(article: article)
              : EditArticle(article: article),
        );
  }

  @override
  void initState() {
    super.initState();
    if (widget.article == null) {
      article = Article(
        title: titleController.text,
        data: contentController.text,
      );
    } else {
      article = widget.article!;
      titleController.text = article.title;
      contentController.text = article.data;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
          title: widget.article == null ? 'Add Article' : 'Edit Article'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(Constants.padding),
              children: [
                Field(
                  controller: titleController,
                  hintText: 'Title',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 10),
                Field(
                  controller: contentController,
                  hintText: 'Content',
                  fieldType: FieldType.multiline,
                  maxLength: null,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
          BlocConsumer<ArticleBloc, ArticleState>(
            listener: (context, state) {
              if (state is ArticlesLoaded) {
                context.pop();
              }

              if (state is ArticleError) {
                logger(state.error);
              }
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(Constants.padding),
                child: MainButton(
                  title: 'Save',
                  loading: state is ArticlesLoading,
                  active: active,
                  onPressed: onSave,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
