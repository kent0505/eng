import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/lesson.dart';
import '../screens/lesson_screen.dart';

class LessonTile extends StatefulWidget {
  const LessonTile({
    super.key,
    required this.lesson,
    required this.index,
  });

  final Lesson lesson;
  final int index;

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) {
        setState(() => _opacity = 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      child: Button(
        onPressed: () {
          context.push(
            LessonScreen.routePath,
            extra: widget.lesson,
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
              Text(widget.lesson.title),
            ],
          ),
        ),
      ),
    );
  }
}
