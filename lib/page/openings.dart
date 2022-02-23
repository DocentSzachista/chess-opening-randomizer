
import 'package:chess/models/chess_game.dart';
import 'package:chess/page/create_opening.dart';
import 'package:chess/widgets/footer_button.dart';
import 'package:chess/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:chess/widgets/navigation.dart';
import 'show_opening.dart';
import 'package:chess/database/db_provider.dart';

/// page to display all openings that are currently in database
class OpeningsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: NavigationDrawer(),
      appBar: AppBar(

      title: Text("Listed openings"),

    ),
    body: _OpeningsList(),
      bottomNavigationBar: FooterButton(text: "Add new opening", onClick: ()=> linkToCreator(context) )
    );
  }
  void linkToCreator(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AddOpening()) );
  }


}

/// list class
class _OpeningsList extends StatelessWidget {


  Future<List<Game>> _fetchFromDb() async{
    var db = ChessDatabase.instance;
    var returnedGame = await  db.readAll();
    return returnedGame;
  }



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future:  _fetchFromDb(),
        builder: (context, snapshot) {
      Widget child;
      if(snapshot.hasData){
        List<Game> openings = snapshot.data as List<Game>;
        child = ListView(
          padding: const EdgeInsets.all(5.0),
            children: <Widget>[
              ...openings.map(
                      (opening) => _opening(
                          title: opening.openingName,
                          clicked: () => selectedOpening(context, opening)
                      )).toList(),
            ],
        );
      }
      else{
        child = MyProgressIndicator();
      }
      return child;
    });


  }
  /// single list tile, required parameters: title of opening, clicked: function reference
  Widget _opening({required String title, VoidCallback? clicked}) {
    return Card(
        child: ListTile(
          title: Text(title),
          onTap: clicked,)
    );
  }

  ///function used to relocate to view where you can display opening data
  void selectedOpening(BuildContext context, Game opening) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  (ShowOpening(opening: opening,))));
  }
}




