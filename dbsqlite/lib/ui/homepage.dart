import 'package:dbsqlite/model/user.dart';
import 'package:dbsqlite/ui/todo_list.dart';
import 'package:dbsqlite/util/helper.dart';

import 'package:dbsqlite/util/user_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertToDo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteToDo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Todo App"),
      ),
      body: Column(
        children: [
          Todolist(
            insertFunction: addItem,
            deleteFunction: deleteItem,
          ),
          UserInputs(insertFunction: addItem),
        ],
      ),
    );
  }
}
