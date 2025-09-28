import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Constants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top;

    return Container(
      height: Constants.appBarHeight + top,
      padding: EdgeInsets.only(top: top),
      child: const Row(
        children: [
          SizedBox(width: Constants.padding),
          Text(
            'Home',
            style: TextStyle(
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
