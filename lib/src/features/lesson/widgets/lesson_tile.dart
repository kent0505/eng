import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/button.dart';
import '../models/lesson.dart';
import '../screens/lesson_screen.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        context.push(
          LessonScreen.routePath,
          extra: lesson,
        );
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(lesson.title),
          ],
        ),
      ),
    );
  }
}
