// ignore_for_file: avoid_print

import 'package:dbsqlite/ui/homepage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var dt = DateTime.now();
  // print(dt);
  // var db = DatabaseConnect();
  // await db.insertToDo(Todo(
  //     id: 1,
  //     title: "This is Sample title",
  //     creationDate: DateTime.now().toString(),
  //     isChecked: false));
  // print(await db.getToDo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
