import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/widgets/field.dart';
import '../../core/widgets/main_button.dart';

class TestWidgets extends StatefulWidget {
  const TestWidgets({super.key});

  @override
  State<TestWidgets> createState() => _TestWidgetsState();
}

class _TestWidgetsState extends State<TestWidgets> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Constants.padding),
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
          hintText: 'Password',
          fieldType: FieldType.password,
        ),
        const SizedBox(height: 10),
        Field(
          controller: controller3,
          hintText: 'Multiline',
          fieldType: FieldType.multiline,
        ),
        const SizedBox(height: 10),
        Field(
          controller: controller4,
          hintText: 'Number',
          fieldType: FieldType.number,
        ),
        const SizedBox(height: 10),
        Field(
          controller: controller5,
          hintText: 'Decimal',
          fieldType: FieldType.decimal,
        ),
        const SizedBox(height: 10),
        Field(
          controller: controller6,
          hintText: 'Phone',
          fieldType: FieldType.phone,
        ),
      ],
    );
  }
}
