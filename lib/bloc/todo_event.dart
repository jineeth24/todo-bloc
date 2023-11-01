part of 'todo_bloc.dart';


sealed class TodoEvent {}

class AddTodoEvent extends TodoEvent{
   final TodoModel todo;

  AddTodoEvent(this.todo);
  List<Object> get props => [todo];
}

class GetTodoEvent extends TodoEvent{}
class DeleteTodoEvent extends TodoEvent{
  final String id;
  DeleteTodoEvent(this.id);
}
