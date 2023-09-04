abstract class TodoState{

}

class TodoLoadingState extends TodoState{}
class TodoLoadedState extends TodoState{
 final  List<dynamic> todos;
 TodoLoadedState(this.todos);
}

class TodoErrorState extends TodoState{
  final String message;
  TodoErrorState(this.message);
}
