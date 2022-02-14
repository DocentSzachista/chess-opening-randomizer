import 'package:flutter/material.dart';
import './header_row.dart';

class MoveTable extends StatelessWidget {
   List<Map<String, List<String>>> moves = [
    {"move" : ["1", "e4", "e5"]},
  ];


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      HeaderRow(),
      ...moves.map((move) {
        return ChessMoveRow((move["move"] as List<String>));
      }).toList(),
    ],);
  }
}
