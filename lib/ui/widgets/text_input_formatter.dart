import 'package:flutter/services.dart';

class TemplateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // this fixes backspace bug of Flutter
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }
    final template = newValue.text == 'a' ? '今から帰ります。' : newValue.text;

    return TextEditingValue(
      text: template,
      selection: TextSelection.collapsed(offset: template.length),
    );
  }
}

