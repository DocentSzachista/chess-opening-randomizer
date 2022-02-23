

import 'package:flutter/material.dart';
import 'package:chess/page/openings.dart';

import '../main.dart';

class NavigationDrawer extends StatelessWidget {

  static const Color _textColor = Colors.white;
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( child: Material(

      color:  Colors.blueGrey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: <Widget>[
           listHeader(text: "Menu"),
           listViewItem(text: "Random generator", icon: Icons.book_online, clicked: () => selectedItem(context, 0)),
           listViewItem(text: "Show all openings", icon: Icons.bookmarks_sharp, clicked: ()=>selectedItem(context, 1)),
        ],
      ),
    ),
    );
  }

  Widget listViewItem({required String text, required IconData icon, VoidCallback? clicked}) {
      const double fontSize = 18;
      return ListTile(
        leading: Icon(icon, color:  _textColor,),
        title: Text(text, style: TextStyle(fontSize: fontSize, color: _textColor) ,),
        onTap: clicked,
      );
  }
  void selectedItem(BuildContext context, int index){
      Navigator.of(context).pop();
      switch(index){
        case 0:
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ChessApp()));
          Navigator.popUntil(context, ModalRoute.withName('/'));
          break;
        case 1:
          Navigator.pushNamed( context, '/openings' );
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>OpeningsPage() ));
          break;
      }
  }
  Widget listHeader({required text}){
     return ListTile( title: Text(text,
       textAlign: TextAlign.center,
       style: TextStyle(color: _textColor, fontSize: 36),) );
  }
}
