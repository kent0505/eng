import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../lesson/screens/lesson_edit_screen.dart';
import '../bloc/home_bloc.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Constants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top;
    final state = context.watch<HomeBloc>().state;

    return Container(
      height: Constants.appBarHeight + top,
      padding: EdgeInsets.only(top: top),
      child: Row(
        children: [
          SizedBox(width: Constants.padding),
          Text(
            switch (state) {
              HomeInitial() => 'Home',
              HomeFavorite() => 'Favorites',
              HomeSettings() => 'Settings',
            },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: AppFonts.w600,
            ),
          ),
          const Spacer(),
          Button(
            onPressed: () {
              context.push(
                LessonEditScreen.routePath,
                extra: null,
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
