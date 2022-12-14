import 'package:flutter/material.dart';
import 'widgets/todo_item.dart';

class TO_DO extends StatelessWidget {
  final ToDo todo;
  final ondelete;

  const TO_DO({Key? key, required this.todo,required this.ondelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          print('clicek');
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((20))),
        tileColor: Colors.white,

        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18.0,
            fontWeight: FontWeight.bold,

          ),
        ),
        trailing: IconButton(
          onPressed: (){
            ondelete(todo.id);
          },
          icon: Icon(Icons.delete),
        )
      ),
    );
  }
}
