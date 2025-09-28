import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routePath = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Settings'),
      body: ListView(
        children: const [],
      ),
    );
  }
}
