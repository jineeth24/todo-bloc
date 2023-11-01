import 'dart:convert';

import 'package:todobloc/model/todo_model.dart';
import 'package:http/http.dart' as http;

const getUrl = "https://api.nstack.in/v1/todos";
final uri = Uri.parse(getUrl);

class TodoServices {
   List <TodoModel>todoList=[];

  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(uri);
    final json=jsonDecode(response.body) as Map<String,dynamic>;
    final result=json['items'] ;
    //convert the list of todos to list of todo objects using fromJson
    todoList.clear();
    for (Map<String, dynamic> i in result) {
            todoList.add(TodoModel.fromJson(i));
          }
       
     return todoList; 


  }

  Future<void> addTodo(TodoModel todo) async {
    //convert the todo to json using tojson
    final body={
      "title":todo.title,
      "description":todo.description,
      "is_completed":todo.isCompleted
    };
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    //getTodos();
    
    
    // print("");
    // print(response.statusCode);
  }

  Future<void> deleteTodo(String id)async{
   // final uri=getUrl+"\/"+id;
    final uri="$getUrl/$id";  

    print(uri);
    final response=await http.delete(Uri.parse(uri));
    print(response.statusCode);
    getTodos();
  }
}
