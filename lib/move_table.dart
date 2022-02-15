import 'package:flutter/material.dart';
import './header_row.dart';

class MoveTable extends StatelessWidget {
  final List<String> columns;

  MoveTable(this.columns);

  static const List<Map<String, List<String>>> moves = [
    {
      "move": ["1.", "e4", "e5"]
    },
    {
      "move": ["2.", "e5", "e4"]
    },
  ];

  DataColumn _generateDataColumn(String text) {
    return DataColumn(
      label:
         Expanded(
                child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        )),


      numeric: false,
    );
  }

  DataCell _generateDataCell(String text) {
    return DataCell(Align(
        alignment: Alignment.center,
        child: Text(
      text,
      textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
    )));
  }

  @override
  Widget build(BuildContext context) {
    // dirty trick  https://stackoverflow.com/questions/56625052/how-to-make-a-multi-column-flutter-datatable-widget-span-the-full-width
    return Row(children: [
       Expanded(child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: DataTable(
           columns: <DataColumn>[
             ...columns.map((column) {
               return _generateDataColumn(column);
             }).toList(),
           ], rows: <DataRow>[
         ...moves.map((element) {
           return DataRow(
             cells: <DataCell>[
               ...(element['move'] as List<String>).map((moveRow) {
                 return _generateDataCell(moveRow);
               })
             ],
           );
         }).toList()
       ])))
    ],);
  }
}
