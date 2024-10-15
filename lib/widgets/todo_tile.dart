import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            fillColor: WidgetStateProperty.all<Color>(Colors.white),
            checkColor: Colors.amber.shade300,
            side: WidgetStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Colors.amber.shade300),
            ),
            value: context.watch<TodoProvider>().todos.firstWhere((element) => element.id == todo.id).done,
            onChanged: (value) {
              Provider.of<TodoProvider>(context, listen: false).check(todo, value!);
            },
          ),
        ),
      ),
    );
  }
}
