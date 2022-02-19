import 'package:chess/models/chess_game.dart';
import 'package:flutter/material.dart';

class ShowOpening extends StatefulWidget {
  Game opening;
  ShowOpening({required this.opening});

  @override
  _ShowOpeningState createState() => _ShowOpeningState(this.opening);
}

class _ShowOpeningState extends State<ShowOpening> {
  final Game _opening;

  _ShowOpeningState(this._opening);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_opening.openingName),
      ),
      body: Text(_opening.moves),
    );
  }
}

