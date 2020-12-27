import 'package:ass3/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ChangeNotifierProvider(
     create: (context){
     return AppProvider();
     },
     child: MaterialApp(
      home: Screen1(),
  ),
   );
  }

}
class Screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Task Name is ${context.watch<AppProvider>().taskName}'),
          Text('Task Complate is ${context.watch<AppProvider>().isComplate}'),
          RaisedButton(onPressed: (){
              Provider.of<AppProvider>(context, listen: false)
                  .satValues('play', true);
              })
        ],
      ),),
    );

  }

}