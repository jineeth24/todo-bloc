import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobloc/bloc/todo_bloc.dart';
import 'package:todobloc/model/todo_model.dart';
import 'package:todobloc/services.dart/todo_services.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
 // TodoServices todoInstance = TodoServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              controller: titleController,
              decoration: InputDecoration(hintText: "title"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(hintText: "description"),
              keyboardType: TextInputType.multiline,
              controller: descriptionController,
            ),
            SizedBox(
              height: 20,
            ),

            TextButton(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;
                final todo = TodoModel(title: title, description: description);
               // context.read<TodoBloc>().add(AddTodoEvent(todo));
               BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(todo));
                onAdd();
              },
              child: Text("ADD"),
            ),
        
          ],
        ),
      )),
    );
  }

  void onAdd() {
    // final title=titleController.text;
    // final description=descriptionController.text;
    // final todo= TodoModel(title: title, description: description);
    // context.read<TodoBloc>().add(AddTodoEvent(todo));
    //todoInstance.addTodo(todo);
    // todoInstance.getTodos();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("addded"),
        duration: Duration(seconds: 1),
      ),
    );
    Timer(
      Duration(seconds: 2),
      () => Navigator.pop(context),
    );
  }
}
