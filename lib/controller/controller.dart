import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/todo_model.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  late Database database;

  void createDatabase() async {
    //get a location using getDatabasePath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');

    openAppDatabase(path: path);
  }

  void deleteTheDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');
    await deleteDatabase(path);
  }

  void openAppDatabase({required String path}) async {
    //open the database
    await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT,description TEXT,time INTEGER,favorite INTEGER, completed INTEGER)');
        debugPrint('database is Created');
      },
      onOpen: (Database db) {
        database = db;
        getAllData();
        debugPrint('database is opened');
      },
    );
  }

  List<TodoModel> list = [];

  void getAllData() async {
    var allData = await database.query('todo');

    for (var i in allData) {
      list.add(TodoModel.fromJson(i));
    }
    debugPrint(allData.toString());
    update();
  }

  void insertData() async {
    var insert = await database.insert('todo', {
      'title': 'go',
      'description': 'go to school',
      'time': '10',
      "favorite": 0,
      "completed": 0
    });
    debugPrint('data insert =>$insert');
    getAllData();
  }

  void updateData() async{
    var updateData = await database.update('todo',{
      'title': 'play',
      'description': 'go football',
      'time': '12',
      "favorite": 1,
      "completed": 1
    },
    where: 'id=${1}',
    );
    debugPrint('update item $updateData');
    getAllData();
  }

  void deleteData() async{
    var deletedItem = await database.delete('todo',where: 'id=${1}');
    debugPrint('deleted item $deletedItem');
    getAllData();
  }
}
