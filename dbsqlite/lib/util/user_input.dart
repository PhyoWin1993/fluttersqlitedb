import 'package:dbsqlite/model/user.dart';
import 'package:flutter/material.dart';

// class UserInput extends StatefulWidget {
//   const UserInput({Key? key}) : super(key: key);

//   @override
//   State<UserInput> createState() => _UserInputState();
// }

// class _UserInputState extends State<UserInput> {
//   final Function insertFunction;
//   var textController = TextEditingController();

//   _UserInputState(this.insertFunction);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//       color: const Color(0xFFDAB5FF),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: TextField(
//                 controller: textController,
//                 decoration: const InputDecoration(
//                   hintText: "add new todo",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           GestureDetector(
//               onTap: () {
//                 var myTodo = Todo(
//                     title: textController.text,
//                     creationDate: DateTime.now().toString(),
//                     isChecked: false);
//                 insertFunction(myTodo);
//               },
//               child: Container(
//                 color: Colors.red,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                 child: const Text(
//                   'add ',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
class UserInputs extends StatelessWidget {
  Function insertFunction;
  var textController = TextEditingController();
  UserInputs({
    Key? key,
    required this.insertFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: const Color(0xFFDAB5FF),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "add new todo",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                var myTodo = Todo(
                    title: textController.text,
                    creationDate: DateTime.now().toString(),
                    isChecked: false);
                insertFunction(myTodo);
              },
              child: Container(
                color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: const Text(
                  'add ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
