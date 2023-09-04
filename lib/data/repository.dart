
import 'dart:convert';

import 'package:http/http.dart' as http;
class ToDoRepo{
  final graphql = "http://192.168.100.14:2000/graphql";


  fetchTodo()async{
   final request = {
   'query': '''

   query  {
  todos {
    id title content
  }
}


'''
   };

   final response = await http.post(
    Uri.parse(graphql),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request)

    );
       print(response.statusCode);
    if(response.statusCode==200){
      
      var result = await jsonDecode(response.body);
       final todos = result['data']['todos'];
       return todos;
    }
  }


  addTodo({required String id, required String title, required String content}) async{
       final request = {
   'query': '''
    mutation AddTodo(\$id:String, \$title:String, \$content:String){
      addTodo(id:\$id, title:\$title, content:\$content){
        id title content
      }
    }


''',
'variables':{
  'id':id,
  'title':title,
  'content':content
}
   };



    final response = await http.post(
    Uri.parse(graphql),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request)

    );

    if(response.statusCode==200){
     // var result = await jsonDecode(response.body);
      print('inserted successfully');
      
    
  }else{
    print(response.statusCode);
  }
  }






  deleteTodo({required String id,}) async{
       final request = {
   'query': '''
    mutation deleteTodo(\$id:String){
      deleteTodo(id:\$id){
        id 
      }
    }


''',
'variables':{
  'id':id,
  
}
   };



    final response = await http.post(
    Uri.parse(graphql),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request)

    );

    if(response.statusCode==200){
      //var result = await jsonDecode(response.body);
      print('deleted successfully');
      
    
  }else{
    print(response.statusCode);
  }
  }
}