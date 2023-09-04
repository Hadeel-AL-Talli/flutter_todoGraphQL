import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_events.dart';
import 'package:todoapp_graphql/bloc/todo_states.dart';
import 'package:todoapp_graphql/data/repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  final ToDoRepo repo;
  TodoBloc(this.repo): super(TodoLoadingState()){
    on<FetchTodos>((event, emit) async{
      emit(TodoLoadingState());
      try{
        final todos = await repo.fetchTodo();
        emit(TodoLoadedState(todos));
      }catch(e){
        emit(TodoErrorState(e.toString()));
      } 
    });


    on<AddTodo> ((event, emit)async {
      emit(TodoLoadingState());

      try{
    await repo.addTodo(id: event.id, title: event.title, content: event.content);

    add(FetchTodos());
      }catch(e){
    emit(TodoErrorState(e.toString()));
      }
    },);



    on<DeleteTodo> ((event, emit)async {
      emit(TodoLoadingState());

      try{
    await repo.deleteTodo(id: event.id);

    add(FetchTodos());
      }catch(e){
emit(TodoLoadingState());
      }
    },);
  }

}