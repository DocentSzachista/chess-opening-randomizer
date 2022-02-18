import 'package:flutter/material.dart';


class MoveTable extends StatelessWidget {
  final List<String> columns;
  final List<Map<String, List<String>>> moves ;
  final List<String> movesAnother = ['e4 e5', 'Sf3', 'Sc6'];
  MoveTable({ required this.columns, required this.moves });

  DataColumn _generateDataColumn(String text) {
    return DataColumn(
      label:
         Expanded(
                child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),
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
    return DataTable(
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
    ]);
  }
}
