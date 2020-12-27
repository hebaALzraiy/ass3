import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String taskName = 'read';
  bool isComplate = false;
  satValues(String taskName,bool isComplate){
    this.taskName = taskName;
    this.isComplate = isComplate;
    notifyListeners();
  }

}