import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todos/controllers/todo.controller.dart';
import 'package:todos/stores/app.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final todoController = new TodoController(store);
    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Observer(
            builder: (_) => FlatButton(
                onPressed: () {
                  todoController.changeSelection("today");
                },
                child: Text(
                  "Hoje",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: store.currentState == "today"
                          ? FontWeight.bold
                          : FontWeight.w100),
                )),
          ),
          Observer(
            builder: (_) => FlatButton(
                onPressed: () {
                  todoController.changeSelection("tomorrow");
                },
                child: Text(
                  "Amanhã",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: store.currentState == "tomorrow"
                          ? FontWeight.bold
                          : FontWeight.w100),
                )),
          ),
          Observer(
            builder: (_) => FlatButton(
                onPressed: () {
                  todoController.changeSelection("all");
                },
                child: Text(
                  "Todas",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: store.currentState == "all"
                          ? FontWeight.bold
                          : FontWeight.w100),
                )),
          ),
        ],
      ),
    );
  }
}
