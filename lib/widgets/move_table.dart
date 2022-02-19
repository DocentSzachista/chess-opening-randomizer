import 'package:flutter/material.dart';


class MoveTable extends StatelessWidget {

  final List<String> columns =  [
    "Nr",
    "White",
    "Black"
  ];
  /// list of moves to display in DataTable
  /// TODO: try to simplify datastructure in nearest future
  final List<Map<String, List<String>>> moves ;

  MoveTable({  required this.moves });
  /// helper function to generate table Column
  DataColumn _generateDataColumn(String text) {
    return DataColumn(
      label:
         Expanded(
                child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 24),
        )),


      numeric: false,
    );
  }
  /// helper function to generate table DataCell
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
    return Column( children: <Widget>[
      Row(children: <Widget>[
        Expanded( child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  _retrieveDataTable()  ),
        ),

      ],
      ),]
    );

  }
  /// generate DataTable basing on moves list
  Widget _retrieveDataTable(){
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
