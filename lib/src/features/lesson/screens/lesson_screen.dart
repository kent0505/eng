import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../core/widgets/appbar.dart';
import '../models/lesson.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key, required this.lesson});

  static const routePath = '/LessonScreen';

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: lesson.title,
        // right: Container(
        //   color: Colors.amberAccent,
        //   child: Button(
        //     minSize: 60,
        //     onPressed: () {},
        //     child: SvgWidget(
        //       Assets.back,
        //     ),
        //   ),
        // ),
      ),
      body: MarkdownBody(
        data: lesson.content,
        styleSheet: MarkdownStyleSheet(
          p: TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
          ),
          strong: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
