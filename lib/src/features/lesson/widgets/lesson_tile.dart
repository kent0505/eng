import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/slidable_widget.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../bloc/lesson_bloc.dart';
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
    return SlidableWidget(
      onDelete: () {
        DialogWidget.show(
          context,
          title: 'Delete Lesson?',
          confirm: true,
          onPressed: () {
            Slidable.of(context)?.close();
            context.read<LessonBloc>().add(DeleteLesson(lesson: lesson));
            context.pop();
          },
        );
      },
      child: AnimatedTile(
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
                  lesson.title,
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
      ),
    );
  }
}
