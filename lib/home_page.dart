import 'package:flutter/material.dart';
import 'package:todolist/dialog_box.dart';
import 'package:todolist/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List toDoList = [
   
   
  ];
 
  void checkBoxChanged(bool? value,int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){

    setState(() {
       toDoList.add([_controller.text,false]);
       _controller.clear();
    });

    Navigator.of(context).pop();
  }
 
  void UpdateTask(int index,String task){
   setState(() {
          toDoList[index][0] = task;
      
   });

   Navigator.of(context).pop();
 
  }

  void DeleteTask(int index){
    setState(() {
       toDoList.removeAt(index);
    });
       Navigator.of(context).pop();

  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
        return DialogBox(controller: _controller,onSave: saveNewTask,onCancel: () => Navigator.of(context).pop(),);
    },);
  }

 
  @override
  Widget build(BuildContext context) {
    return  
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
       backgroundColor: Colors.red,
       appBar: AppBar(title: Container(alignment: Alignment.center,child: Text('To Do',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),),),backgroundColor: Color.fromARGB(255, 221, 221, 221),),
       floatingActionButton:FloatingActionButton(onPressed:(){ 
          createNewTask();
        },child: Icon(Icons.add),),
       body: ListView.builder(
            itemCount:  toDoList.length,
            itemBuilder: (context, index){
            
              return ToDoTile(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index),updateTask: UpdateTask,index:index,deleteTask:DeleteTask);
            
            }

        ),
    )
    );
    
 
  }
}