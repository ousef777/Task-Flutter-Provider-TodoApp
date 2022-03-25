import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  var todos = [
    Todo(id: 1, title: "todo"),
  ];

  void addTodo({required String title}) {
    var todo = Todo(
      id: todos.isNotEmpty ? todos[todos.length - 1].id + 1 : 1,
      title: title,
    );

    todos.insert(0, todo);

    notifyListeners();
  }

  void toggleDone(int id) {
    Todo todoToUpdate = todos[todos.indexWhere((todo) => todo.id == id)];
    todoToUpdate.done = !todoToUpdate.done;
    notifyListeners();
  }
}
