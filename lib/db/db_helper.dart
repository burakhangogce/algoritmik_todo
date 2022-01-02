import 'package:algoritmik_todo/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print("creating new a one");
        return db.execute("CREATE TABE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRİNG, note TEXT, date STRING, "
            "startTime STRİNG, endTime STRING, "
            "remind INTEGER, repeat STRING, "
            "color INTEGER, "
            "isCompleted INTEGER)");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }
}
