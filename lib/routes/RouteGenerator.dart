import 'package:flutter/material.dart';

import '../models/chess_game.dart';
import '../page/opening_generation.dart';
import '../page/openings.dart';
import '../page/show_opening.dart';


/// RouteGenerator to resolve routing in app
class RouteGenerator {

  static Route<dynamic> generate(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => OpeningGenerationPage(appTitle: "Chess openings randomizer"));
      case '/openings':
        return MaterialPageRoute(builder: (context)=> OpeningsPage());
      case '/show_opening':
        return MaterialPageRoute(builder: (context)=> ShowOpening(opening: args as Game));
      default:
        return MaterialPageRoute(builder: (context) => _errorWidget());
    }
  }
  /// display info about error
  static Widget _errorWidget(){
    return Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children:const <Widget>[
          Text("Error, no route here")
        ],
    ),
    );
  }
}