
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:chess/models/chess_game.dart';




class ChessDatabase{
    static final ChessDatabase instance = ChessDatabase._init();
  ///private constructor - following singleton for db
    ChessDatabase._init();

   static Database? _database;
   /// retrieve database, if none exists create a new one
   Future<Database> get database async{
    if(_database!= null) return _database!;

    _database = await _initDatabase('chessDB.db');
    return _database!;
  }
  Future<Game> create(Game game) async{
     final db = await instance.database;
     final id = await db.insert(tableName, game.toJSON());

     return game.copy(id : id);
  }
  Future<Game> read(int id) async{
     final db = await instance.database;

     final maps = await db.query(tableName,
       columns: GameFields.columnNames,
       where: '''${GameFields.id} = ?''' ,
       whereArgs: [id],
     );
     if (maps.isNotEmpty) {
       return Game.fromJson(maps.first);
     }
    else{
      throw Exception("No id $id found");
     }

  }


   /// initialize a new database
  Future<Database> _initDatabase(String dbFileName) async {
    // recover location of our DatabasePath
    final dbPath = await getDatabasesPath();
    // connect it with our new filename
    final path = join(dbPath, dbFileName);
    // return new Database if we want to update in future we need to add onUpdate param,
    // and change version on upper version
    return await openDatabase(path, version: 1, onCreate:  _createDB);

  }
  /// database creation because yes :)
  FutureOr<void> _createDB(Database db, int version) async {
     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
     const textType = 'TEXT NOT NULL';

    await db.execute(
        '''
        CREATE TABLE $tableName (
          ${GameFields.id}  $idType,
          ${GameFields.openingName} $textType,
          ${GameFields.moves} $textType
        
        );
    '''
    );
  }
  /// close the database when we don't want to work with it anymore
  Future close() async{
    final db = await instance.database;
    db.close();
  }
}