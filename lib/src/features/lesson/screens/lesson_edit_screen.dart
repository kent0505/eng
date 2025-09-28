import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/lesson_bloc.dart';
import '../models/lesson.dart';

class LessonEditScreen extends StatefulWidget {
  const LessonEditScreen({super.key, required this.lesson});

  static const routePath = '/LessonEditScreen';

  final Lesson? lesson;

  @override
  State<LessonEditScreen> createState() => _LessonEditScreenState();
}

class _LessonEditScreenState extends State<LessonEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  late Lesson lesson;

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
    lesson.title = titleController.text;
    lesson.data = contentController.text;

    context.read<LessonBloc>().add(
          widget.lesson == null
              ? AddLesson(lesson: lesson)
              : EditLesson(lesson: lesson),
        );
  }

  @override
  void initState() {
    super.initState();
    if (widget.lesson == null) {
      lesson = Lesson(
        title: titleController.text,
        data: contentController.text,
      );
    } else {
      lesson = widget.lesson!;
      titleController.text = lesson.title;
      contentController.text = lesson.data;
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
      // resizeToAvoidBottomInset: false,
      appBar:
          Appbar(title: widget.lesson == null ? 'Add Lesson' : 'Edit Lesson'),
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
          BlocConsumer<LessonBloc, LessonState>(
            listener: (context, state) {
              if (state is LessonsLoaded) {
                context.pop();
              }

              if (state is LessonError) {
                logger(state.error);
              }
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(Constants.padding),
                child: MainButton(
                  title: 'Save',
                  loading: state is LessonsLoading,
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
