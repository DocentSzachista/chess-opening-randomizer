import 'package:chess/models/chess_game.dart';
import 'package:chess/page/openings.dart';
import 'package:chess/widgets/footer_button.dart';
import 'package:chess/widgets/move_table.dart';
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

//  final FooterButton button = FooterButton(text: "text", onClick:() {print("xD");} );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:  Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  (OpeningsPage())));
        }
        ),
        title: Text(_opening.openingName),
      ),
      body: MoveTable( moves: _opening.convertForAppTable()),
     // bottomNavigationBar: button,
    );
  }

}

