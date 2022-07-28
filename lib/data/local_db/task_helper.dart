import 'dart:async';
import 'package:todo_app/data/local_db/db_helper.dart';
import 'package:todo_app/data/models/task_model.dart';

class TaskHelper {
  static final TaskHelper _instance = new TaskHelper.internal();

  factory TaskHelper() => _instance;

  TaskHelper.internal();

  final tableName = "tasksTable";
  String tablePrimaryKey = "taskID";

  Future<int> savePost(TaskModel row) async {
    var dbClient = await (DBHelper().db);
//    row.logoImage =await getImageLogo(row.memberID.toString());
    var res = await dbClient.insert("$tableName", row.toJson());
    return res;
  }

  Future<List<TaskModel>> getAll() async {
    var dbClient = await (DBHelper().db);
    List<Map> result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.length == 0
        ? []
        : result
            .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Future<TaskModel?> get(String id) async {
    var dbClient = await (DBHelper().db);
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE ${tablePrimaryKey}=?", [id]);
    if (result.length == 0) return null;

    return new TaskModel.fromJson(result.first);
  }

  Future<int> delete(String? id) async {
    var dbClient = await (DBHelper().db);
    return await dbClient
        .delete(tableName, where: "$tablePrimaryKey = ?", whereArgs: [id]);
  }

  Future<int> update(TaskModel row) async {
    var dbClient = await (DBHelper().db);
    return await dbClient.update(tableName, row.toJson(),
        where: "${tablePrimaryKey} =?", whereArgs: [row.taskID]);
  }

  Future<bool> deleteAll() async {
    List<TaskModel> result = await getAll();

    if (result.length > 0) {
      for (var row in result) {
        await delete(row.taskID.toString());
      }
    }
    return true;
  }

  Future close() async {
    var dbClient = await (DBHelper().db);
    return dbClient.close();
  }
}
