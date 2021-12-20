import 'dart:async';

import 'package:dbsqlite/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnect {
  Database? _database;
//start Creation Database
  Future<Database?> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "todo.db");
    _database = await openDatabase(path, version: 1, onCreate: _oncreate);
    return _database;
  }

  FutureOr<void> _oncreate(Database db, int version) async {
    await db.execute('''CREATE TABLE todo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      creationDate TEXT,
      isChecked INTEGER)
      ''');
  } // end creation Database

  Future<void> insertToDo(Todo todo) async {
    final db = await database;
    await db?.insert("todo", todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteToDo(Todo todo) async {
    debugPrint("Deleted id is ===>> ${todo.id}");
    final db = await database;
    await db?.delete(
      'todo',
      where: 'id=?',
      whereArgs: [todo.id],
    );
  }

  Future<List<Todo>> getToDo() async {
    final db = await database;
    final List<Map<String, dynamic>> items = await db!.query(
      'todo',
      orderBy: 'id DESC',
    );

    return List.generate(
        items.length,
        (index) => Todo(
              id: items[index]['id'],
              title: items[index]['title'],
              creationDate: items[index]['creationDate'],
              isChecked: items[index]['isChecked'] == 1 ? true : false,
            ));
  }
}
