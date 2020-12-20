import 'package:ass3/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db_helper.dart';

class TaskWidget extends StatefulWidget{
  Task task;
  Function function;
  TaskWidget(this.task, [this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Card(
     margin: EdgeInsets.all(10),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Text(widget.task.taskName),
       IconButton(
           icon:Icon(
             Icons.delete,
             color: Colors.red,
           ), onPressed: (){
         Task task =
         Task(taskName: 'play',isComplate: true);
         DBHelper.dbHelper.deleteData(task);

       })
       ,
       Checkbox(
           value: widget.task.isComplate,
           onChanged: (value){
             Task task =
             Task(taskName: 'play',isComplate: true);
             DBHelper.dbHelper.updateData(task);

       }
       )



   ],),));
  }
}