import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../models/lesson.dart';
import 'lesson_edit_screen.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key, required this.lesson});

  static const routePath = '/LessonScreen';

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: lesson.title,
        right: Button(
          onPressed: () {
            context.push(
              LessonEditScreen.routePath,
              extra: lesson,
            );
          },
          minSize: 60,
          child: const Icon(Icons.edit_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: MarkdownBody(
          data: lesson.data,
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
