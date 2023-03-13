import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onChanged;
  const ToDoItem({super.key,required this.todo,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 12),
      child: ListTile(
          onTap: () {
            onChanged(todo);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: purple200)),
          tileColor: purple50,
          leading: RichText(
              text: TextSpan(
                text: todo.todoTime,
                style: TextStyle(
                color: purple100, fontWeight: FontWeight.w600, fontSize: 16),
            children:  <TextSpan>[
              TextSpan(
                  text: '-',
                  style: TextStyle(color: purple100, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
              TextSpan(
                  text: todo.todoText!,
                  style: TextStyle(fontWeight: FontWeight.w600, color: black),
                  ),
            ],
          )),
          trailing: Icon(
            todo.isDone? Icons.check_box : Icons.check_box_outline_blank,color: purple100 ),
          ),
    ));
  } 
}
