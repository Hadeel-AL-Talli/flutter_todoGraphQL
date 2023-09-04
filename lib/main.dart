import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_events.dart';
import 'package:todoapp_graphql/data/repository.dart';
import 'package:todoapp_graphql/ui/todo_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<ToDoRepo>(
        create: (context) => ToDoRepo(),
        child:BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(context.read<ToDoRepo>())..add(FetchTodos()),
          child: TodoScreen(),
          ),
          ),
    
    );
  }
}