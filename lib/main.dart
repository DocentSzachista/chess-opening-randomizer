import 'package:chess/widgets/move_table.dart';
import 'package:flutter/material.dart';

import 'database/db_provider.dart';
import 'models/chess_game.dart';
import 'widgets/progress_indicator.dart';
import 'package:chess/widgets/navigation.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var game = Game(moves: "1. d4 d5 2. c4 e6 3. Sf3 b6", openingName: 'Slovakian');
  /*var db = ChessDatabase.instance;
  db.create(game);
   var returnedGame = db.readAll();
   returnedGame.then((value) {
     for (var game in value)
       {
          print("Opening ${game.openingName}");
       }
   });*/
  runApp( ChessApp());
}

class ChessApp extends StatelessWidget {
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
        drawer: NavigationDrawer(),
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

  final List<List<Map<String, List<String>>>> _move = []  ;

  // simple aquiring of data from database that is used in FutureBuilder class
  Future<List<Game>> _fetchFromDb() async{
    var db = ChessDatabase.instance;
    var returnedGame = await  db.readAll();
    return returnedGame;
  }

  var indeks = 0;

  void onClick(){
    setState(() {
      indeks = (indeks + 1)%2;
    });
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

        future: _fetchFromDb(),
        builder: (context, snapshot) {
          Widget child;
          if(snapshot.hasData){
            List<Game> gamesList = snapshot.data as List<Game>;
              for(var game in gamesList){
                _move.add(game.convertForAppTable());
              }
              child = MoveTable( moves:  _move[indeks]);
          }
          else
            {
              child = MyProgressIndicator();
            }
          return Column( children: <Widget>[
            child,
            TextButton(
              onPressed: onClick,
              child: const Text("Randomize opening "),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                backgroundColor: Colors.grey,
                textStyle: const TextStyle(fontSize: 20),
              ),
            )
          ])

          ;
        });

  }
  
}
