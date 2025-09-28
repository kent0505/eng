import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    logger(width);

    return Button(
      onPressed: onPressed,
      child: Container(
        height: 100,
        width: width >= 400 ? (width / 3 - 16) : (width / 2 - 20),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
