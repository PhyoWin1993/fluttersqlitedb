// ignore_for_file: avoid_unnecessary_containers

import 'package:dbsqlite/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ToDoCard extends StatefulWidget {
  final int id;
  final String title;
  final String creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  ToDoCard({
    Key? key,
    required this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);
    return Card(
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
          ),

          //
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat('dd MMM yyyy - hh:mm aaa')
                    .format(DateTime.parse(widget.creationDate)),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8F8F8F),
                ),
              )
            ],
          )),

          //3 delete
          IconButton(
              onPressed: () {
                widget.deleteFunction(anotherTodo);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
