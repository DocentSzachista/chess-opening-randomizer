import 'package:flutter/material.dart';
import 'package:chess/widgets/navigation.dart';
class OpeningsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(

      title: Text("Listed openings"),

    ),
    body: Text("jestem tutaj"),
    );
  }
}
