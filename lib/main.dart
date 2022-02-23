import 'package:chess/page/opening_generation.dart';

import 'package:chess/routes/RouteGenerator.dart';
import 'package:flutter/material.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //var game = Game(moves: "1. d4 d5 2. c4 e6 3. Sf3 b6", openingName: 'Slovakian');
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
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generate,
      home: OpeningGenerationPage(appTitle: appTitle),
    );
  }
}



