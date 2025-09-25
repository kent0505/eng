import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const routePath = '/AuthScreen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool login = true;

  void onLoginOrRegister() {
    context.read();
  }

  void change() {
    setState(() {
      usernameController.clear();
      passwordController.clear();
      login = !login;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Field(
              controller: usernameController,
              textCapitalization: TextCapitalization.none,
              hintText: 'Username',
            ),
            const SizedBox(height: Constants.padding),
            Field(
              controller: passwordController,
              fieldType: FieldType.password,
              hintText: 'Password',
            ),
            const SizedBox(height: Constants.padding),
            MainButton(
              title: login ? 'Login' : 'Register',
              onPressed: onLoginOrRegister,
            ),
            const SizedBox(height: Constants.padding),
            Button(
              onPressed: change,
              child: Text(login ? 'Register' : 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
