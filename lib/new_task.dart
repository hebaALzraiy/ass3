import 'package:ass3/constants.dart';
import 'package:ass3/db_helper.dart';
import 'package:ass3/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget{
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isComplate = false;

  String taskName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
   appBar: AppBar(
     title: Text('New Task'),
   ),
   body: Container(
     padding: EdgeInsets.all(20),
     child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
     TextField(
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20))),
       onChanged: (value){
         this.taskName = value;
       },
     ),
     Checkbox(value: isComplate, onChanged: (value){
       this.isComplate = value;
       setState(() {

       });
     }),
       RaisedButton(
         child: Text('Add New Task'),
         onPressed: (){
           Task task =
               Task(taskName: 'play',isComplate: true);
           DBHelper.dbHelper.insertNewTaskRaw(task);
         }
           )
   ],),),
 );
  }
}