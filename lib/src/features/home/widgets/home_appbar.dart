import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/home_bloc.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.appBarSize);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final state = context.watch<HomeBloc>().state;

    return Container(
      height: Sizes.appBarSize + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Row(
        children: [
          SizedBox(width: Sizes.listViewPadding),
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
        ],
      ),
    );
  }
}
