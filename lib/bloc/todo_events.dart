abstract class TodoEvent{

}

class FetchTodos extends TodoEvent{}
class AddTodo extends TodoEvent{
  final String id;
  final String title;
  final String content;

  AddTodo(this.id, this.title, this.content);
}

class DeleteTodo extends TodoEvent{
  final String id;
  DeleteTodo(this.id);
}