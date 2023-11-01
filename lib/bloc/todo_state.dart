part of 'todo_bloc.dart';

//@immutable
sealed class TodoState {
  final List todoList=[];
}

class TodosLoadingState extends TodoState {}
class TodosLoadedState extends TodoState {
  final List<TodoModel> todos;
  TodosLoadedState(this.todos);
}
class TodosErrorState extends TodoState {
  final String error;
  TodosErrorState(this.error);
}