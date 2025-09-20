import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/err.dart';
import '../../../core/widgets/loading_widget.dart';
import '../bloc/word_bloc.dart';
import 'word_tile.dart';

class WordsList extends StatelessWidget {
  const WordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordBloc, WordState>(
      builder: (context, state) {
        if (state is WordsLoading) {
          return const LoadingWidget();
        }

        if (state is WordsLoaded) {
          List<int> indexes = List.generate(
            state.words.length,
            (index) => index,
          )..shuffle();

          return RefreshIndicator(
            onRefresh: () async {
              context.read<WordBloc>().add(GetWords());
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(Constants.padding),
              itemCount: state.words.length,
              itemBuilder: (context, index) {
                return WordTile(
                  word: state.words[index],
                  index: indexes[index],
                );
              },
            ),
          );
        }

        if (state is WordError) {
          return Err(
            error: state.error,
            onReload: () {
              context.read<WordBloc>().add(GetWords());
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
