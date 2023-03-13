class ToDo{
  String? id;
  String? todoTime;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoTime,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo>todoList(){
     return[
         ToDo(id: "01",todoTime: '6:30 pm', todoText: 'Morning Exercise', isDone: true),
         ToDo(id: '02',todoTime: '9:30 pm',todoText: "Buy Grocery", isDone: true),
         ToDo(id: '03',todoTime: '10:30 pm',todoText: 'Check Emails'),
     ];
  }
}
