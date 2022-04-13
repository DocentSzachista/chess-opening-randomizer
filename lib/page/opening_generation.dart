

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:chess/widgets/navigation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/db_provider.dart';
import '../models/chess_game.dart';
import '../widgets/move_table.dart';
import '../widgets/progress_indicator.dart';



class OpeningGenerationPage extends StatelessWidget {
  OpeningGenerationPage() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.openingRandPageName)
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

  final List<List< List<String>>> _move = []  ;
  final Random random = Random();
  DateTime now = DateTime.now();
  String _lastDate = "";
  int _indeks = 0;


  // simple aquiring of data from database that is used in FutureBuilder class
  Future<List<Game>> _fetchFromDb() async{
    var db = ChessDatabase.instance;
    var returnedGame = await  db.readAll();
    return returnedGame;
  }
  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastDate = (prefs.getString('lastDate') ?? "");
    });
  }
  @override
  void initState(){
    super.initState();
    loadCounter();
  }

  // TODO: make some sort of generation engine
  void  onClick() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _indeks = random.nextInt(_move.length);
      _lastDate = DateFormat("yyyy-MM-dd").format(now);
      prefs.setString("lastDate", _lastDate);
      print(_lastDate);
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
            child = MoveTable( moves:  _move[_indeks]);
          }
          else
          {
            child = MyProgressIndicator();
          }
          return Column( children: <Widget>[
            Text("${AppLocalizations.of(context)!.lastDraw}: ${_lastDate}",
            style: TextStyle(fontSize: 20)),
            child,
            TextButton(
              onPressed: onClick,
              child: Text(AppLocalizations.of(context)!.randButton),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                backgroundColor: Colors.grey,
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ])

          ;
        });

  }

}
