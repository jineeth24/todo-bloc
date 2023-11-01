class TodoModel {
  final String? id;
  final String title;
  final String description;
  final bool isCompleted;

  TodoModel(
      {this.id,required this.title,
      required this.description,
      this.isCompleted = false});

  factory TodoModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final todo = TodoModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
    );
    return todo;
  }
  // Map<String, dynamic> toJson(TodoModel todo) {
  //   return {
  //     "title": todo.title,
  //     "description": todo.description,
  //     "is_completed": todo.isCompleted,
  //   };
  // }


}
