import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_events.dart';



Widget cardWidget(todo)=> Builder(
  builder: (context){
final todoBloc = BlocProvider.of<TodoBloc>(context);
return Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: ListTile(
    title: Text(todo['title'], style: TextStyle(color: Colors.black),),

    subtitle: Text(todo['content']),
    trailing: IconButton(
      onPressed: (){todoBloc.add(DeleteTodo(todo['id']));},
      icon: Icon(Icons.delete),
       ),
  ),
);
  });

