import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:chess/page/opening_generation.dart';
import 'package:chess/routes/RouteGenerator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Startup function
void main() {
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



