import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/main_button.dart';
import '../bloc/user_bloc.dart';
import '../screens/auth_screen.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return Column(
                children: [
                  MainButton(
                    title: 'Login',
                    onPressed: () {
                      context.push(AuthScreen.routePath);
                    },
                  ),
                ],
              );
            }
            return const Text('data');
          },
        ),
      ],
    );
  }
}
