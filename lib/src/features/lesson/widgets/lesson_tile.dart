import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/button.dart';
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
    return Slidable(
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 100 / MediaQuery.of(context).size.width,
        motion: const ScrollMotion(),
        children: [
          _DeleteButton(lesson: lesson),
        ],
      ),
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
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Button(
        onPressed: () {
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
        child: Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.radius),
          ),
          child: const Center(
            child: Icon(Icons.delete_rounded),
          ),
        ),
      ),
    );
  }
}
