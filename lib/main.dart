import 'package:chess/page/opening_generation.dart';

import 'package:chess/routes/RouteGenerator.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generate,
      home: const OpeningGenerationPage(appTitle: appTitle),
    );
  }
}



