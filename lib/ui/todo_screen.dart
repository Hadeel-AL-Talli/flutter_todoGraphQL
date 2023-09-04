import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_states.dart';
import 'package:todoapp_graphql/ui/widgets/add_todo_widget.dart';
import 'package:todoapp_graphql/ui/widgets/card_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent, 
      title: Text("Todo List Graph Ql")),



      body: BlocConsumer<TodoBloc, TodoState>(
        builder: (context,state){
          if(state is TodoLoadingState){
            
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is TodoLoadedState){
            return ListView.builder(
              itemBuilder: (context, index){
             return cardWidget(state.todos[index]);
              }, 
              itemCount: state.todos.length);
          }
          else{
            return Container();
          }
        } , 
        listener:(context, state){
          if(state is TodoErrorState){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        } ),


        floatingActionButton: addTodoWidget(),
    );
  }
}