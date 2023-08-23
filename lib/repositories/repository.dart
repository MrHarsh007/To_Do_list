import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/repositories/database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection();
  }

  static late Database _database;

  Future<Database> get database async{
    if (_database!=null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
//Read Data from table by Id
  readDataById(table, itemId) async{
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs:[itemId]);
  }

  // update data from table
  updateData(table, data) async {
    var connection = await database;
    return await connection.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }
//delete data from table
  deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM &table WHERE id = &itemId");
  }
}