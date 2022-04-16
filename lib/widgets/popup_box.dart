import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {

  final title;
  final description;
  static const _textStyle = TextStyle(color:  Colors.white, fontSize: 18);
  static const _titleTextStyle = TextStyle(color:  Colors.white, fontSize: 24);
  const PopupBox({
      required this.title ,
      required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text(title),
      content: Text(description),
      titleTextStyle: _titleTextStyle,
      contentTextStyle: _textStyle,

      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: const Text("Ok", style: _textStyle,),
        ),
      ],
      backgroundColor: Colors.blueGrey,
    );
  }
}
