import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../../lesson/widgets/lessons_list.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_appbar.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom:
                  Sizes.navBarSize + MediaQuery.of(context).viewPadding.bottom,
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
                    HomeFavorite() => 1,
                    HomeSettings() => 2,
                  },
                  children: [
                    const LessonsList(),
                    ListView(
                      padding: EdgeInsets.all(Sizes.listViewPadding),
                      children: [
                        MainButton(
                          title: 'Test',
                          active: controller1.text.isNotEmpty,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        Field(
                          controller: controller1,
                          hintText: 'Text',
                          onChanged: (_) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 10),
                        Field(
                          controller: controller2,
                          hintText: 'Multiline',
                          fieldType: FieldType.multiline,
                        ),
                        const SizedBox(height: 10),
                        Field(
                          controller: controller3,
                          hintText: 'Number',
                          fieldType: FieldType.number,
                        ),
                        const SizedBox(height: 10),
                        Field(
                          controller: controller4,
                          hintText: 'Decimal',
                          fieldType: FieldType.decimal,
                        ),
                        const SizedBox(height: 10),
                        Field(
                          controller: controller5,
                          hintText: 'Phone',
                          fieldType: FieldType.phone,
                        ),
                      ],
                    ),
                    const Placeholder(),
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
