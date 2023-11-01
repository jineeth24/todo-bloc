import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobloc/bloc/todo_bloc.dart';
import 'package:todobloc/screens/add_todo_screen.dart';
import 'package:todobloc/services.dart/todo_services.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoServices serviceController = TodoServices();
  @override
void initState() {
  super.initState();
  context.read<TodoBloc>().add(GetTodoEvent());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: SafeArea(
          // child: FutureBuilder(
          //   future: serviceController.getTodos(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Container(
          //           height: 200,
          //           width: 200,
          //           color: Colors.amber,
          //             child:const Text(
          //           'Error fetching data',
          //           style: TextStyle(color: Colors.red),
          //         )),
          //       );
          //     } else {
          //       return ListView.builder(
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (context, index) {
          //           final data = snapshot.data![index];
          //           return Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: ListTile(
          //               title: Text(data.title),
          //               subtitle: Text(data.description),
          //               trailing: IconButton(
          //                 icon: Icon(Icons.more_vert),
          //                 onPressed: () {
          //                   serviceController.deleteTodo(data.id.toString());
          //                 },
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //   },
          // ),
          child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoadingState) {
            return CircularProgressIndicator();
          } 
          else if (state is TodosLoadedState) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing:  IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoBloc>().add(DeleteTodoEvent(todo.id.toString()));
                            //serviceController.deleteTodo(data.id.toString());
                          },
                  // Add more UI elements or actions as needed
                ),);
              },
            );
          } else if (state is TodosErrorState) {
            return Text('Error: ${state.error}');
          }
          return Container();
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
        },
      ),
    );
  }
}
