import 'package:flutter/material.dart';


class HeaderRow extends StatelessWidget{
  static const styleHeader = TextStyle(fontSize: 30, fontWeight: FontWeight.bold );
  static const List<String> columnNames = [
    "Nr",
    "White",
    "Black"
  ];
  @override
  Widget build(BuildContext context) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var columnName in columnNames) ColumnMyTable(columnName, styleHeader ),
          ],
      );
  }

}
class ChessMoveRow extends StatelessWidget{
  final List<String> dataRow;
  static const  TextStyle styleData = TextStyle(fontSize: 28 );
  ChessMoveRow(this.dataRow);

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         for (var data in dataRow)   ColumnMyTable(data, styleData),
      ],);
  }

}



class ColumnMyTable extends StatelessWidget {
  final String columnName;
  final TextStyle textStyle;

  ColumnMyTable(this.columnName, this.textStyle );

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text(columnName, style: textStyle ,),
    );
  }
}

