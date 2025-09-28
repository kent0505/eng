import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});

  static const routePath = '/ListeningScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Listening'),
      body: ListView(
        children: const [],
      ),
    );
  }
}
