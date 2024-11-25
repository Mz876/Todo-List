import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
 
   final String taskName;
   final bool   taskCompleted;
   Function(bool?)? onChanged;
   void Function(int index,String text) updateTask;
    int index;
   void Function(int index) deleteTask;
 
   ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.updateTask,required this.index,required this.deleteTask});

 

  @override
  Widget build(BuildContext context){

        TextEditingController _textController = TextEditingController(text: taskName);

    return Padding(
      padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 25.0),
       child:GestureDetector(
        onTap:(){  
            showDialog(context: context, builder:(BuildContext context){
               return   
                    AlertDialog(title: Text('Task'),content: SizedBox(height: 200, child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                 TextField(controller: _textController,decoration:InputDecoration(border: OutlineInputBorder()),),
                 SizedBox(height: 20,),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed:(){
                        updateTask(index,_textController.text);
                     },child:Text("Update"),),SizedBox(width: 8,),ElevatedButton(onPressed: (){
                      deleteTask(index);
                     },
                       
                      child: Text("Delete"))
                   ],
                 )
               ],),),);
             });
          },
   child: Container(
         padding: EdgeInsets.all(24),
         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
         child: Row( children: [ 
          Checkbox( 
          value: taskCompleted,
          onChanged: onChanged,activeColor: Colors.black,),
          Text(taskName,style:TextStyle(decoration:taskCompleted ? TextDecoration.lineThrough:TextDecoration.none )   )]),
          
      ),
       ),
   
    ); 
  }
}