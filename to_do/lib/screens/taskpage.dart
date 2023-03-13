import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/model/todo.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final todosList=ToDo.todoList();
  final toDoController = TextEditingController();
  final toDotimeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //new task heading
            Container(
              padding: EdgeInsets.only(top: 200.0,bottom: 36.0),
              child: Text(
                'New Task',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: black,
                  fontSize: 20.0
                ),
              ),
            ),
            //set time
            Container(
              margin: EdgeInsets.only(left:10,right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 13.0,
                vertical: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: purple200
                )
              ),
              child: TextField(
                controller: toDotimeController,
                decoration: InputDecoration(
                  hintText: "Set Time",
                  hintStyle: TextStyle(fontSize: 14,color: grey),
                  border: InputBorder.none
                ),
              ),
            ),
            //add description
            Container(
              margin: EdgeInsets.only(left:10,right: 10,top: 12),
              padding: EdgeInsets.only(
                left: 13.0,right: 13,top: 5,bottom: 80
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: purple200
                )
              ),
              child: TextField(
                controller: toDoController,
                decoration: InputDecoration(
                  hintText: "Add Description",
                  hintStyle: TextStyle(fontSize: 14,color: grey),
                  border: InputBorder.none
                ),
              ),
            ),
            //button
            Container(
              padding: EdgeInsets.only(top: 64),
              child: ElevatedButton(
          onPressed: () {
            addToDoItem(toDotimeController.text, toDotimeController.text);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: purple100,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 52
            )
          ),
          child: const Text('SET TASK',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900
          ),
          ),
        ),
            )
          ],
         ),
      )
    );
  }
  void addToDoItem(String toDo,String todoTime){
    todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoTime: todoTime, todoText: toDo));
    toDoController.clear();
  }
}