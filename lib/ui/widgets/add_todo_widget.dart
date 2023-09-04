import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_graphql/bloc/todo_events.dart';

import '../../bloc/todo_bloc.dart';


GlobalKey<FormState> formKey = GlobalKey<FormState>();
var idController = TextEditingController();

var titleController = TextEditingController();
var contentController = TextEditingController();



Widget addTodoWidget()=> Builder(
  builder: (context){
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
      showDialog(context: context,
       builder: (context){
   
        return AlertDialog(
          title: Text("Add Todo"),
          content: Form(
            key: formKey,

            child: Column(
              mainAxisSize: MainAxisSize.min,


              children: [
                TextFormField(
                  controller:idController,
                  decoration: InputDecoration(label: Text('id'),
                  
                  ),
                  validator: (v){
                    if(v!.isEmpty){
                      return 'it is empty';
                    }else{
                      return null;
                    }
                  },
                ),



                TextFormField(
                  controller:titleController,
                  decoration: InputDecoration(label: Text('title'),
                  
                  ),
                  validator: (v){
                    if(v!.isEmpty){
                      return 'it is empty';
                    }else{
                      return null;
                    }
                  },
                ),



                TextFormField(
                  controller:contentController,
                  decoration: InputDecoration(label: Text('content'),
                  
                  ),
                  validator: (v){
                    if(v!.isEmpty){
                      return 'it is empty';
                    }else{
                      return null;
                    }
                  },
                )
              ],
            ),
          ),



          actions: [
            TextButton(onPressed: ()=> Navigator.of(context).pop(),
            child: Text('cancle'),
            ),

            ElevatedButton(
              style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
              onPressed: (){
                if(formKey.currentState!.validate()){
                  todoBloc.add(AddTodo(idController.text, titleController.text, contentController.text));

                  Navigator.of(context).pop();
                }
              }, 
            child: Text('Add'))
            
          ],
          );

      });
    });
  },
);