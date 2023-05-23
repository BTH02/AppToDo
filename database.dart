import 'package:hive/hive.dart';

class ToDoDatabase{
  final _myBox = Hive.box('mybox');
  List toDoList = [];
  void createInitiaData(){
    toDoList = [
      ["Make tutorial",false],
      ["Do exercise",false]
    ];
  }
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }
  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}