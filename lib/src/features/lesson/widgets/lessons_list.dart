import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/err.dart';
import '../../../core/widgets/loading_widget.dart';
import '../bloc/lesson_bloc.dart';
import 'lesson_tile.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state is LessonLoading) {
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
    );
  }
}
