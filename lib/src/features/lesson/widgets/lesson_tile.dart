import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/button.dart';
import '../models/lesson.dart';
import '../screens/lesson_screen.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({
    super.key,
    required this.lesson,
    required this.index,
  });

  final Lesson lesson;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedTile(
      index: index,
      child: Button(
        onPressed: () {
          context.push(
            LessonScreen.routePath,
            extra: lesson,
          );
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.radius),
          ),
          child: Row(
            children: [
              Text(lesson.title),
            ],
          ),
        ),
      ),
    );
  }
}
