import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: const <Widget>[
      SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(),
      ),
      Text(
        "Loading data...",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,)
    ],);
  }
}
