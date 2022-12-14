import 'package:flutter/material.dart';
import 'todo.dart';
import 'widgets/todo_item.dart';

void main() {
  runApp(New());
}

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  final todoslist = ToDo.todoList();
  final todocontroler = TextEditingController();

  void deleteitem(String id){
    setState(() {
      todoslist.removeWhere((element) => element.id == id);
    });
  }
  void addtodoitem(String toDo){
   setState(() {
     todoslist.add(ToDo(id: DateTime.now().millisecond.toString(), todoText: toDo));
   });
   todocontroler.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            'TO DO APP',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage('assets/21.jpg'),
                        radius: 20.0),
                  ],
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 5),
                    child: Text(
                      'TO DO APPS',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  for (ToDo todoo in todoslist) TO_DO(todo: todoo,ondelete: deleteitem,),
                ],
              )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.only(bottom: 20, right: 20, left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            controller: todocontroler,
                            decoration: InputDecoration(
                              hintText: 'Add a new todo Item',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              addtodoitem(todocontroler.text);
                            },
                            child: Text(
                              '+',

                              style: TextStyle(fontSize: 30),

                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 10,
                              minimumSize: Size(40, 40),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[800],
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: drawerr(),
            ),
          ),
        ),
      ),
    );
  }
}




Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        label: Text('Search'),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget drawerr() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Center(
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/21.jpg'), radius: 35.0)),
      const Divider(
        color: Colors.grey,
        height: 35.0,
      ),
      const Text(
        'Name',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
      ),
      const SizedBox(height: 10.0),
      const Text(
        'Sanish Shrestha',
        style: TextStyle(
          color: Colors.amberAccent,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 30.0),
      const Text(
        'Current Year',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
      ),
      const SizedBox(height: 10.0),
      const Text(
        '4th',
        style: TextStyle(
          color: Colors.amberAccent,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 30.0),
      Row(
        children: const [
          Icon(
            Icons.email,
            color: Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            'Sanish.shrestha5401@gmail.com',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )
    ],
  );
}
