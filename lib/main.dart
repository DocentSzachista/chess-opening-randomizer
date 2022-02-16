import 'package:chess/move_table.dart';
import 'package:flutter/material.dart';

import 'database/db_provider.dart';
import 'models/chess_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var game = Game(moves: "1. e4 e5 2. Sf3 Sc6 3. Gc4 Gc5", openingName: 'Italian');
 // var db = ChessDatabase.instance;
  //db.create(game);
  // var returnedGame = db.read(1).then((value) {
  //   print(value.convertForAppTable());
  // });
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
  _HomePageState(){
    _fetchFromDb();
  }
  static const List<String> _columnNames = [
    "Nr",
    "White",
    "Black"
  ];
  List<Map<String, List<String>>> _move = [];
   /*List<List<Map<String, List<String>>>> _move = []; [
    [
    {
      "move": ["1.", "e4", "e5"]
    },
    {
      "move": ["2.", "e5", "e4"]
    },
  ],
    [
      {
        "move": ["1.", "e6", "e5"]
      },
      {
        "move": ["2.", "e5", "e4"]
      },
    ]
  ];*/
  void _fetchFromDb(){
    var db = ChessDatabase.instance;
    var returnedGame = db.read(1);
      returnedGame.then((game) {
        setState(() {
          _move = game.convertForAppTable();
        });
      } );
      print(_move);
      //return (returnedGame as Game).convertForAppTable();

  }

  var indeks = 0;

  void onClick(){
    setState(() {
      _move = _move;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Column( children: <Widget>[
      Row(children: <Widget>[
      Expanded( child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: MoveTable( columns: _columnNames, moves:  _move)
          ),
      ),


    ],),
      TextButton(
        onPressed: onClick,
        child: Text("Randomize opening "),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          backgroundColor: Colors.grey,
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),], );

  }
  
}
