import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../lesson/widgets/lessons_list.dart';
import '../../user/widgets/user_widget.dart';
import '../../word/widgets/words_list.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_appbar.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: Constants.navBarHeight +
                  MediaQuery.of(context).viewPadding.bottom,
            ),
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                logger(state.runtimeType);
              },
              buildWhen: (previous, current) {
                return previous.runtimeType != current.runtimeType;
              },
              builder: (context, state) {
                return IndexedStack(
                  index: switch (state) {
                    HomeInitial() => 0,
                    HomeWords() => 1,
                    HomeSettings() => 2,
                  },
                  children: const [
                    LessonsList(),
                    WordsList(),
                    UserWidget(),
                  ],
                );
              },
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
