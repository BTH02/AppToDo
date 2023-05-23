import 'package:app/database.dart';
import 'package:app/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:app/todo_tile.dart';
import 'package:hive/hive.dart';
class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  final _myBox = Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get("TODOLIST")==null){
      db.createInitiaData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

void checkBoxChanged(bool? value, int index){
  setState(() {
    db.toDoList[index][1] = !db.toDoList[index][1];
  });
  db.updateData();
}

void saveNewTask(){
  setState(() {
    db.toDoList.add([ _controller.text,false ]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateData();
}

void createNewTask(){
  showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },);
}

void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.loadData();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("Ghi Chu"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) =>deleteTask(index),
          );
        },
      ),
    );
  }
}