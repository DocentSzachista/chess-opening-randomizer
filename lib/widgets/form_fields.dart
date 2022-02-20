import 'package:flutter/material.dart';



class OpeningTextField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String errorMessage;
  final bool validate;
  int? lenghtLimit;
  bool allowMultiline;
  OpeningTextField({
    required this.controller,
    required this.labelText,
    required this.errorMessage,
    required this.validate,
    this.lenghtLimit,
    this.allowMultiline = false });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: !validate ? errorMessage : null,
        border: OutlineInputBorder(),

        labelText: labelText
      ),
      maxLength:  lenghtLimit,
      maxLines: allowMultiline? 2 : 1,

    );
  }
}
