import 'package:todobloc/model/todo_model.dart';
import 'package:todobloc/services.dart/todo_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the flutter_bloc package

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoServices todoServices;
  TodoBloc(this.todoServices) : super(TodosLoadingState()) {
    on<GetTodoEvent>((event, emit) async {
      final todos = await todoServices.getTodos();
      return emit(TodosLoadedState(todos));
    });


    on<AddTodoEvent>((event,emit)async{
      final todo=event.todo;
      await todoServices.addTodo(todo);
      final updatedTodoList=await todoServices.getTodos();
      return emit(TodosLoadedState(updatedTodoList));
    }
    );
    on<DeleteTodoEvent>((event, emit) async{
      
      await todoServices.deleteTodo(event.id);
      final updatedTodoList=await todoServices.getTodos();
      return emit(TodosLoadedState(updatedTodoList));
    });
  }
  
 
}
