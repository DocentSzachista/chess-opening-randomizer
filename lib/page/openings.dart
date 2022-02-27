import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


import 'package:chess/models/chess_game.dart';
import 'package:chess/page/create_opening.dart';
import 'package:chess/widgets/footer_button.dart';
import 'package:chess/database/db_provider.dart';
import 'package:chess/widgets/navigation.dart';


/// page to display all openings that are currently in database
class OpeningsPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _OpeningsPageState();
}


class _OpeningsPageState extends State<OpeningsPage>{
  final key = GlobalKey<AnimatedListState>();
  late List<Game> _openings;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey,
        drawer: NavigationDrawer(),
        appBar: AppBar(

          title: Text("Listed openings"),

        ),
        body: isLoading == false ? _openingList() : Text("Loaduje"),
        bottomNavigationBar: FooterButton(text: "Add new opening", onClick: ()=> _linkToCreator(context) )
    );
  }
  @override
  void initState() {
    super.initState();
    _refreshOpenings();
  }

  void _linkToCreator(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AddOpening()) );
    _refreshOpenings();
  }

  Future _refreshOpenings() async {
        setState(() {
          isLoading = true;
        });
        _openings = await ChessDatabase.instance.readAll();
        setState(() {
          isLoading = false;
        });
  }

  Widget _openingList() {
    return ListView(

      padding: const EdgeInsets.all(5.0),
      children: <Widget>[
        ..._openings.map(
                (opening) =>
                _opening(
                    title: opening.openingName,
                    clicked: () => selectedOpening(context, opening)
                )).toList(),
      ],

    );
  }

  void _delete(String title) async {
    Game? game = _openings.firstWhereOrNull((element) =>
        element.openingName.contains(title));
    if (game != null) {
      int affected = await ChessDatabase.instance.delete(game.id!);
      if (affected != -1) {
        _openings.remove(game);
        _refreshOpenings();
      }
    }
  }


  /// single list tile, required parameters: @title is a opening title,
  /// @clicked: function reference to resolve onPressed:
  Widget _opening({required String title, VoidCallback? clicked}) {
    return Card(
        child: ListTile(
          title: Text(title),
          onTap: clicked,
          trailing: IconButton(
            icon: Icon(
                Icons.delete
            ),
            onPressed: () => _delete(title),
          ),)
    );
  }

  ///function used to relocate to view where you can display opening data
  void selectedOpening(BuildContext context, Game opening) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/show_opening', arguments: opening);
  }
}




