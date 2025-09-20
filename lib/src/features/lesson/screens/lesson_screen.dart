import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../bloc/lesson_bloc.dart';
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
        right: Row(
          children: [
            Button(
              onPressed: () {
                context.push(
                  LessonEditScreen.routePath,
                  extra: lesson,
                );
              },
              minSize: 60,
              child: const Icon(Icons.edit_rounded),
            ),
            Button(
              onPressed: () {
                DialogWidget.show(
                  context,
                  title: 'Delete Lesson?',
                  confirm: true,
                  onPressed: () {
                    context
                        .read<LessonBloc>()
                        .add(DeleteLesson(lesson: lesson));
                    context.pop();
                    context.pop();
                  },
                );
              },
              minSize: 60,
              child: const Icon(Icons.delete_rounded),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: MarkdownBody(
          data: lesson.content,
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
