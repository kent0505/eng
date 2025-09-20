import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/word.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    super.key,
    required this.word,
    required this.index,
  });

  final Word word;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        // context.push(
        //   LessonScreen.routePath,
        //   extra: lesson,
        // );
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
            Text(word.en),
            const Spacer(),
            Text(word.ru),
          ],
        ),
      ),
    );
  }
}
