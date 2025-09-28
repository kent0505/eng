import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/err.dart';
import '../../../core/widgets/loading_widget.dart';
import '../bloc/lesson_bloc.dart';
import '../widgets/lesson_tile.dart';
import 'lesson_edit_screen.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  static const routePath = '/LessonsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Lessons',
        right: Button(
          onPressed: () {
            context.push(
              LessonEditScreen.routePath,
              extra: null,
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: BlocBuilder<LessonBloc, LessonState>(
        builder: (context, state) {
          if (state is LessonsLoading) {
            return const LoadingWidget();
          }

          if (state is LessonsLoaded) {
            List<int> indexes = List.generate(
              state.lessons.length,
              (index) => index,
            )..shuffle();

            return RefreshIndicator(
              onRefresh: () async {
                context.read<LessonBloc>().add(GetLessons());
              },
              child: ListView.builder(
                itemCount: state.lessons.length,
                itemBuilder: (context, index) {
                  return LessonTile(
                    lesson: state.lessons[index],
                    index: indexes[index],
                  );
                },
              ),
            );
          }

          if (state is LessonError) {
            return Err(
              error: state.error,
              onReload: () {
                context.read<LessonBloc>().add(GetLessons());
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
