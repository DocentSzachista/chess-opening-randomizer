import 'package:chess/move_table.dart';
import 'package:flutter/material.dart';

//import 'move_table.dart';

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
    return MoveTable(_columnNames);

      /*DataTable(

        columns: <DataColumn>[
          DataColumn(
            label: Center(child: Text(_columnNames[0],
                        textAlign: TextAlign.center,)),
            numeric: true,),
          DataColumn(label: Center(child: Text(_columnNames[1],
              )),
            numeric: false,
          ),
          DataColumn(label: Text(_columnNames[2])),
        ],
        rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text("1",  textAlign: TextAlign.center)),
            DataCell(Center(child:Text("e4",  textAlign: TextAlign.center))),
            DataCell(Text("d5")),
          ],),
        ])*/;
  }
  
}
