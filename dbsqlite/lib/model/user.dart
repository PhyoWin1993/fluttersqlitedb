// class User {
//   late String username;
//   late String password;
//   late int id;
//   User(
//     this.username,
//     this.password,
//     this.id,
//   );

//   User.map(dynamic obj) {
//     username = obj["username"];
//     password = obj['password'];
//     id = obj['id'];
//   }

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{};

//     map['username'] = username;
//     map['password'] = password;
//     map["id"] = id;

//     return map;
//   }

//   User.fromMap(Map<String, dynamic> map) {
//     username = map['username'];
//     password = map['password'];
//     id = map['id'];
//   }

// }

class Todo {
  int? id;
  final String title;
  String creationDate;
  bool isChecked;

  Todo({
    this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate,
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'ToDo(id : $id,title:$title,creationDate : $creationDate,isChecked : $isChecked)';
  }
}
