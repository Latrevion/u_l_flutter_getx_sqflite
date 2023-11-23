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
  List<TodoModel> favList = [];

  void getAllData() async {
    list = [];
    favList = [];
    var allData = await database.query('todo');
    for (var i in allData) {
      list.add(TodoModel.fromJson(i));
      if (i['favorite'] == 1) {
        favList.add(TodoModel.fromJson(i));
      }
    }
    update();
    debugPrint(favList.toString());
  }

  void insertData(
      {required String title,
      required String description,
      required String time}) async {
    try {
      var insert = await database.insert('todo', {
        'title': title,
        'description': description,
        'time': time,
        "favorite": 0,
        "completed": 0
      });
      Get.back();
      debugPrint('data insert =>$insert');
      getAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool updateTaskData = false;

  void updateData(
      {required String title,
      required String description,
      required String time,
      required int id}) async {
    try {
      var updateData = await database.update(
        'todo',
        {
          'title': title,
          'description': description,
          'time': time,
          "favorite": 1,
          "completed": 1
        },
        where: 'id = $id',
      );
      debugPrint('update item $updateData');
      getAllData();
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async {
    var deletedItem = await database.delete('todo', where: 'id=$id');
    debugPrint('deleted item $deletedItem');
    getAllData();
  }

  void updateItemIntoFav({required int taskId, required int favorite}) async {
    var favoriteItem = await database.update(
        'todo', {'favorite': (favorite == 0) ? 1 : 0},
        where: "id=$taskId");
    getAllData();
  }
}
