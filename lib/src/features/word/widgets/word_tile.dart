import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/word.dart';

class WordTile extends StatelessWidget {
  const WordTile({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width / 2 - Constants.padding;

    return Button(
      minSize: 30,
      onPressed: () {
        // context.push(
        //   LessonScreen.routePath,
        //   extra: lesson,
        // );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.overScroll,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width,
              child: Text(word.en),
            ),
            SizedBox(
              width: width,
              child: Text(
                word.ru,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
