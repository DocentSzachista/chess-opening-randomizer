import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:chess/page/opening_generation.dart';
import 'package:chess/routes/RouteGenerator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Startup function
void main() {
  // var dub= "1. e3 42 2. e1 da 3. as ds";
  // List<String> ls = dub.split(" ");
  // print(ls);
  // List<List<String>> actual = [];
  // List<String> ls2= [];
  // for(var s in ls){
  //
  //     ls2.add(s);
  //     if(ls2.length == 3){
  //     actual.add(ls2);
  //     ls2=[];
  //   }
  // }
  // print(actual);
  runApp( ChessApp());
}
/// Root widget
class ChessApp extends StatelessWidget {
  /// title of my app
  static const String appTitle = "Chess opening randomizer";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///support for localizations
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      /// supported languages
      supportedLocales: const [
         Locale('en', ''),
         Locale('pl', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generate,
      home:  OpeningGenerationPage(),
    );
  }
}



