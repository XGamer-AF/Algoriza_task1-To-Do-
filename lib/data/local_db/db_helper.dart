import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants/strings.dart' as strings;

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();

  factory DBHelper() => _instance;

  DBHelper.internal();

  final tasksTable = "tasksTable";
  String taskID = "taskID";
  String taskTitle = "taskTitle";
  String taskDeadline = "taskDeadline";
  String startTime = "startTime";
  String endTime = "endTime";
  String isReminded = 'isReminded';
  String remind = "remind";
  String isRepeated = 'isRepeated';
  String repeat = "repeat";
  String taskColor = 'taskColor';
  String taskStatus = 'taskStatus';
  String isFavourite = 'isFavourite';

///////////////////

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, strings.db);
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    db.execute('''
          CREATE TABLE $tasksTable (
          $taskID INTEGER PRIMARY KEY,
          $taskTitle TEXT,
          $taskDeadline TEXT,
          $startTime TEXT,
          $endTime TEXT,
          $isReminded INTEGER,
          $remind TEXT,
          $isRepeated INTEGER,
          $repeat TEXT,
          $taskColor INTEGER,
          $taskStatus TEXT,
          $isFavourite INTEGER
          )
        ''');
  }

  Future close() async {
    var dbClient = await (db);
    return dbClient.close();
  }
}
