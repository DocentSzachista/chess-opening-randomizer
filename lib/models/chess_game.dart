
const String tableName = 'ChessGame';

class GameFields{

  static const List<String> columnNames = [id, moves, openingName];

  static const String id = '_id';
  static const String moves = 'moves';
  static const String openingName = 'openingName';
}






/// Model of our chess game, it needs to contain only moves and opening title at this time
class Game{
  final int? id;
  final String moves;
  final String openingName;

  const Game({
    this.id,
    required this.moves,
    required this.openingName
  });

  Map<String, Object?> toJSON() =>{
    GameFields.id: id,
    GameFields.openingName: openingName,
    GameFields.moves :moves
  };

  Game copy({
    int? id,
    String? moves,
    String? openingName,
  })=>Game(
      id: id ?? this.id,
      moves: moves ?? this.moves,
      openingName: openingName ?? this.openingName);

  static Game fromJson(Map<String, Object?> json) => Game(
    id: json[GameFields.id] as int?,
    moves:  json[GameFields.moves] as String,
    openingName: json[GameFields.openingName] as String,
  );

  // List<Map<String, List<String>>> convertForAppTable(){
  //    List<String> tempData = moves.split(" ");
  //
  //    List<Map<String, List<String>>> returnValue = [];
  //    List<String> temp = [];
  //
  //    for(var element in tempData){
  //      temp.add(element);
  //      if(temp.length == 3) {
  //          returnValue.add({"move": temp});
  //          temp= [];
  //        }
  //
  //    }
  //    return returnValue;
  // }
    List<List<String>> convertForAppTable(){
      List<String> tempData = moves.split(" ");

      List<List<String>> returnValue = [];
      List<String> temp = [];
      for( var element in tempData){
        temp.add(element);
        if(temp.length == 3) {
          returnValue.add(temp);
          temp= [];
        }
      }
      return returnValue;
    }
}