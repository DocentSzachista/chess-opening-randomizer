import 'package:flutter/material.dart';

import 'move_table.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static const String appTitle = "Chess opening randomizer";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle)
          ,),
        body: HomePage(),
      ),
    );
  }
}

/// Widget in which all modification of table will take place
class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
  
}

/// State to hold template data
class _HomePageState extends State<HomePage>{
  static const List<String> _columnNames = [
    "Nr",
    "White",
    "Black"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MoveTable();
  }
  
}
