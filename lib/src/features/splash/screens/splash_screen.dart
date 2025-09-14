import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_widget.dart';
import '../../home/screens/home_screen.dart';
import '../../user/data/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void clear() async {
    context.read<UserRepository>().clear();
  }

  @override
  void initState() {
    super.initState();

    // clear();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          context.go(HomeScreen.routePath);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
