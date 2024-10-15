import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {

  var todos = [
    Todo(id: 1, title: "first todo"),
  ];

  void addTodo({required String title}) {
    var todo = Todo(
      id: todos.isNotEmpty ? todos[todos.length - 1].id + 1 : 1,
      title: title, // <- Here
    );
    print(todo.id);
    todos.add(todo);

    notifyListeners();
  }

  void check(Todo current, bool value) {
    print("checking");
    Todo todo = todos.firstWhere((element) => element.id == current.id);
    todo.done = value;//!todo.done;
    //print(todo.done);
    notifyListeners();
  }
}