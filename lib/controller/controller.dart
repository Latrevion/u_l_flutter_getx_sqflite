import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {

  @override
  void onInit(){
    createDatabase();
    super.onInit();
  }

  void createDatabase() async {
    //get a location using getDatabasePath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');

    openAppDatabase(path: path);
  }

  void deleteTheDatabase() async{
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');
    await deleteDatabase(path);
    print('delete deleteTheDatabase');
  }

  void openAppDatabase({required String path}) async {
    //open the database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT,description TEXT,time favorite INTEGER, completed REAL)');
        debugPrint('database is Created');
      },
      onOpen: (Database database){
        debugPrint('database is opened');
      },

    );
  }

  void getAllData(){}

  void insertData(){}

  void updateData(){}

  void deleteData(){}


}
