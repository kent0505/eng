import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';

class Err extends StatelessWidget {
  const Err({
    super.key,
    required this.error,
    required this.onReload,
  });

  final String error;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontFamily: AppFonts.w400,
            ),
          ),
          const SizedBox(height: 20),
          Button(
            onPressed: onReload,
            child: const Text('Reload'),
          ),
        ],
      ),
    );
  }
}
