import 'package:flutter/material.dart';
import 'dart:math';

import 'package:chess/widgets/navigation.dart';

import '../database/db_provider.dart';
import '../models/chess_game.dart';
import '../widgets/move_table.dart';
import '../widgets/progress_indicator.dart';
class OpeningGenerationPage extends StatelessWidget {
  final String appTitle;
  const OpeningGenerationPage({required String this.appTitle}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(appTitle)
        ,),
      body: HomePage(),
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
  final Random random = Random();
  // simple aquiring of data from database that is used in FutureBuilder class
  Future<List<Game>> _fetchFromDb() async{
    var db = ChessDatabase.instance;
    var returnedGame = await  db.readAll();
    return returnedGame;
  }

  var indeks = 0;

  // TODO: make some sort of generation engine
  void onClick(){
    setState(() {
      indeks = random.nextInt(_move.length);
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
              child: const Text("Get Random Opening"),
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
