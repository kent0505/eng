import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

enum FieldType {
  text,
  multiline,
  number,
  decimal,
  phone,
}

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.controller,
    required this.hintText,
    this.fieldType = FieldType.text,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final FieldType fieldType;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: switch (fieldType) {
        FieldType.text => TextInputType.text,
        FieldType.multiline => TextInputType.multiline,
        FieldType.number => TextInputType.number,
        FieldType.decimal => TextInputType.numberWithOptions(decimal: true),
        FieldType.phone => TextInputType.phone,
      },
      readOnly: readOnly,
      showCursor: !readOnly,
      enableInteractiveSelection: !readOnly,
      inputFormatters: [
        LengthLimitingTextInputFormatter(60),
        if (fieldType == FieldType.number)
          FilteringTextInputFormatter.digitsOnly,
        if (fieldType == FieldType.decimal) _SingleDotInputFormatter(),
        if (fieldType == FieldType.phone) _PhoneInputFormatter()
      ],
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: fieldType == FieldType.multiline ? 10 : 1,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontFamily: AppFonts.w500,
      ),
      decoration: InputDecoration(hintText: hintText),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}

class _SingleDotInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(',', '.');
    if (RegExp(r'^[0-9]*\.?[0-9]*$').hasMatch(text)) {
      final dotCount = '.'.allMatches(text).length;
      if (dotCount > 1) return oldValue;
      return newValue.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    return oldValue;
  }
}

class _PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    if (RegExp(r'^\+?[0-9]*$').hasMatch(text)) {
      if (text.contains('+') && !text.startsWith('+')) return oldValue;
      return newValue;
    }
    return oldValue;
  }
}
