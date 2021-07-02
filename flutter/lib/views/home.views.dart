import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/components/navbar.widget.dart';
import 'package:todos/components/todolist.widget.dart';
import 'package:todos/components/user.widget.dart';
import 'package:todos/controllers/todo.controller.dart';
import 'package:todos/stores/app.store.dart';
import 'package:provider/provider.dart';
import 'package:todos/views/createtodo.view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final todoController = new TodoController(store);

    // State só vai ser NONE, na primeira vez que a aplicação rodar
    if (store.currentState == "none") {
      todoController.changeSelection("today");
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          UserCard(),
          Navbar(),
          Expanded(
            child: Container(
              child: TodoList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTodoView(),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
