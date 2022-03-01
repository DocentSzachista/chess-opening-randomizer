import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoveTable extends StatelessWidget {

 
  /// list of moves to display in DataTable
  /// TODO: try to simplify datastructure in nearest future
  final List< List<String>> moves ;

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
          child:  _retrieveDataTable(context)  ),
        ),

      ],
      ),]
    );

  }
  /// generate DataTable basing on moves list
  Widget _retrieveDataTable(BuildContext context){
      return DataTable(
          columns: <DataColumn>[
            ...AppLocalizations.of(context)!.tableHeaders.split(":").map((column) {
              return _generateDataColumn(column);
            }).toList(),
          ], rows: <DataRow>[
        ...moves.map((element) {
          return DataRow(
            cells: <DataCell>[
              ...(element ).map((moveRow) {
                return _generateDataCell(moveRow);
              })
            ],
          );
        }).toList()
      ]);
  }
}
