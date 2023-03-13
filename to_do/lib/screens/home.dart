import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import '../screens/taskpage.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Homee extends StatefulWidget {
  Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  final todosList=ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //avatar photo
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 17.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/avatar.jpeg',
                          height: 80.0,
                          width: 80.0,
                        ))),
                //salutation and username
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 36.0),
                        child: Text(
                          'Hello!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Abhinaba',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: purple100,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //level and experience
                Container(
                    padding: EdgeInsets.only(left: 79.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 36.0),
                          child: Row(
                            children: [
                              Container(
                                  child: ClipRRect(
                                child: Image.asset(
                                  'assets/images/command.png',
                                  height: 18,
                                  width: 18,
                                ),
                              )),
                              Container(
                                  child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 8.0)),
                                  const Text(
                                    'LVL ',
                                    style: TextStyle(
                                        color: purple100,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                        color: purple100,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  child: Image.asset(
                                    'assets/images/award.png',
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 8.0)),
                                    Text(
                                      'EXP' + ' 1' + '/4',
                                      style: TextStyle(
                                        color: grey,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 55,left: 10,right: 10),
                  children: [
                    Container(
                      child: Text("Today's task",
                      style: TextStyle(
                        fontSize: 14,
                        color: grey,
                      ),),
                    ),
                    for( ToDo todoo in todosList)
                      ToDoItem(todo: todoo,onChanged: handleToDochange,),
                  ],
                ),
              ),
            
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Taskpage()));
        },
        child: ClipRRect(
          child: Image.asset(
            'assets/images/add.png',
            height: 72.0,
            width: 64.0,
          ),
        ),
      ),
    );
  }

  void handleToDochange(ToDo todo){
    setState((){
       todo.isDone=!todo.isDone;
    });
    
  }
}