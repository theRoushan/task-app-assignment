import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.maxLength,
    this.maxLines,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: _border(Colors.grey.shade400),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.grey.shade400),
        focusedBorder: _border(Colors.grey.shade400),
        enabledBorder: _border(Colors.grey.shade400),
      ),
      validator: validator,
    );
  }
}
