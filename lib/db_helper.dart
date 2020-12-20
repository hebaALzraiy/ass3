import 'dart:io';
import 'package:ass3/constants.dart';
import 'package:ass3/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';



class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();
  static Database _database;
   Future<Database> get database async{
     if(_database != null) {
       return _database;
     }else{
       _database = await initDb();
       return _database;
     }
     }





  static  String dbName = 'TasksDb.db';
  static  String tabelName = 'Tasks';
  static String columnIdName = 'TaskId';
  static String columnTaskName = 'TaskName';
  static String columnIsCompleteName = 'TaskComplete';


  initDb()async{

  try{
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = join(appDocDir.path, 'TasksDb.db');
  return await openDatabase(
  path,
  version: 1
   );
  }catch(error){
  print(error);
  }
}

createTaskTable()async{
    Database db = await database;
    await db.execute('''
    CREATE TABLE $tabelName(
    $columnIdName INTEGER PRIMARY KEY  AUTOINCREMENT,
    $columnTaskName TEXT,
    $columnIsCompleteName INTEGER
    )
    ''');
}
insertNewTaskRaw(Task task) async{
    Database db = await database;
    try{var x = await db.rawInsert(
      "INSERT Into $tabelName ($columnTaskName,$columnIsCompleteName)"
        "VALUES(?,?)" ,[task.taskName,task.isComplate?1:0]);
    print(x);}
    catch(error){
      print(error);

    }


}
updateData(Task task) async {
    try {
      Database db = await initDb();
    int resalt = await  db.update(tabelName, task.toMap(),
      where: '$columnTaskName=?' , whereArgs: [task.taskName]
    );
    print(resalt);
    } on Exception catch (e) {
      // TODO
    }
}

deleteData(Task task) async{
    try {
      Database db = await initDb();
     int resalt = await db.delete(tabelName,
         where: '$columnTaskName=?' , whereArgs: [task.taskName]);
     print(resalt);
    } on Exception catch (e) {
      // TODO
    }

}
}