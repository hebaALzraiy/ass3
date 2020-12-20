import 'package:ass3/constants.dart';
import 'package:ass3/new_task.dart';
import 'package:ass3/task_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarPage(),
    );
  }
}
class TabBarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
     child: Scaffold(
     appBar: AppBar(
       actions: [
         IconButton(icon:Icon(
           Icons.add,
           color: Colors.white,
           size: 50.0,
         ), onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return NewTask();
           },
           ));
         })
       ],
     title: Text ('My Task'),
       bottom: TabBar(tabs: [
         Tab(
           text: 'All Tasks',
         ),
         Tab(
           text: 'Complate Tasks',
         ),
         Tab(
           text: 'InComplate Tasks',
         )
       ],
         isScrollable: true,
       ),
   ),
     body: TabBarView(
       children: [
         AllTasks(),
         ComplateTasks(),
         InComplateTasks(),
       ],
     ),
     ),
   );
  }

}
class AllTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child: SingleChildScrollView(
         child: Column(children: tasksList.map((e) => TaskWidget(e)).toList()))
     ,);
  }

}
class ComplateTasks extends StatefulWidget{
  @override
  _ComplateTasksState createState() => _ComplateTasksState();
}

class _ComplateTasksState extends State<ComplateTasks> {
  myFun(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
          child: Column(children: tasksList.where((element) => element.isComplate==true).map((e) => TaskWidget(e, myFun())).toList()))
      ,);
  }
}
class InComplateTasks extends StatefulWidget{
  @override
  _InComplateTasksState createState() => _InComplateTasksState();
}

class _InComplateTasksState extends State<InComplateTasks> {
  myFun(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
      child: Column(
          children: tasksList.where((element) => element.isComplate==false).map((e) => TaskWidget(e, myFun())).toList()),
    )
      ,);
  }
}



