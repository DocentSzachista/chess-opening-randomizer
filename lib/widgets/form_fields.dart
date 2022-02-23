import 'package:flutter/material.dart';



class OpeningTextField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String errorMessage;
  final bool validate;
  final int? lenghtLimit;
  final bool allowMultiline;
  OpeningTextField({
    required this.controller,
    required this.labelText,
    required this.errorMessage,
    required this.validate,
    this.lenghtLimit = null,
    this.allowMultiline = false });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: !validate ? errorMessage : null,
        border: OutlineInputBorder(),
        labelText: labelText,
        contentPadding: EdgeInsets.all(20.0),
      ),
      maxLength:  lenghtLimit,
      maxLines: allowMultiline? 2 : 1,),
    );
  }
}
