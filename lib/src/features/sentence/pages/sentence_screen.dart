import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class SentenceScreen extends StatelessWidget {
  const SentenceScreen({super.key});

  static const routePath = '/SentenceScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(title: 'Sentence'),
      body: Column(
        children: [],
      ),
    );
  }
}
