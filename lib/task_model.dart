import './db_helper.dart';
class Task{
  int taskId;
  String taskName;
  bool isComplate;
  Task({this.taskId,this.taskName , this.isComplate});

  factory Task.fromJson(Map<String , dynamic> json) => Task(
    taskId: json[DBHelper.columnIdName],
    taskName: json[DBHelper.columnTaskName],
    isComplate: json[DBHelper.columnIsCompleteName]);

  Map <String , dynamic> toMap(){
    return {
      DBHelper.columnTaskName:taskName,
      DBHelper.columnIsCompleteName:isComplate?1:0
    };
    }
    }


