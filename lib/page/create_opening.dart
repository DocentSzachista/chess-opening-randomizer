import 'package:flutter/material.dart';
class AddOpening extends StatefulWidget {
  const AddOpening({Key? key}) : super(key: key);

  @override
  _AddOpeningState createState() => _AddOpeningState();
}

class _AddOpeningState extends State<AddOpening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new opening"),),
      body: Text("I am a creator"),
    );
  }
}
