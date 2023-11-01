import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobloc/bloc/todo_bloc.dart';
import 'package:todobloc/screens/add_todo_screen.dart';
import 'package:todobloc/screens/todo_list.dart';
import 'package:todobloc/services.dart/todo_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TodoServices todocontroller=TodoServices();
    // todocontroller.getTodos;
    return BlocProvider(
      create: (context) => TodoBloc(TodoServices()),
      child: MaterialApp(
        theme: ThemeData.light(),
        home: TodoListScreen(),
      ),
    );
  }
}
