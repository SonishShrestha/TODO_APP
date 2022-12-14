class ToDo {
  String? id;
  String? todoText;


  ToDo({required this.id,required this.todoText});

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01',todoText: 'Morning Exercise'),
      ToDo(id: '02',todoText: 'Brush your teeth'),
      ToDo(id: '03',todoText: 'Eat breakfast'),
      ToDo(id: '04',todoText: 'Buy Groceries'),
      ToDo(id: '05',todoText: 'Check Emails'),
    ];
  }
}