import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/button.dart';
import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height:
            Constants.navBarHeight + MediaQuery.of(context).viewPadding.bottom,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                _NavBarButton(
                  index: 1,
                  title: 'Home',
                  asset: Assets.home1,
                  asset2: Assets.home2,
                  active: state is HomeInitial,
                ),
                _NavBarButton(
                  index: 2,
                  title: 'Words',
                  asset: Assets.profile1,
                  asset2: Assets.profile2,
                  active: state is HomeWords,
                ),
                _NavBarButton(
                  index: 3,
                  title: 'Profile',
                  asset: Assets.profile1,
                  asset2: Assets.profile2,
                  active: state is HomeSettings,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.index,
    required this.asset,
    required this.asset2,
    required this.title,
    required this.active,
  });

  final String title;
  final String asset;
  final String asset2;
  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        onPressed: active
            ? null
            : () {
                context.read<HomeBloc>().add(ChangePage(index: index));
              },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: SvgWidget(
                active ? asset2 : asset,
                key: ValueKey(active),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontFamily: AppFonts.w500,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
