import 'package:dbsqlite/util/helper.dart';
import 'package:dbsqlite/util/todo_card.dart';
import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  const Todolist({
    Key? key,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DatabaseConnect();
    return Expanded(
      child: FutureBuilder(
        future: db.getToDo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var datas = snapshot.data;
          var datalength = datas!.length;
          // debugPrint(" Total Data is ==> $datalength");

          return datalength == 0
              ? const Center(
                  child: Text("no data found"),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) {
                    return ToDoCard(
                      id: datas[i].id,
                      title: datas[i].title,
                      creationDate: datas[i].creationDate,
                      isChecked: datas[i].isChecked,
                      insertFunction: insertFunction,
                      deleteFunction: deleteFunction,
                    );
                  });
        },
      ),
    );
  }
}
