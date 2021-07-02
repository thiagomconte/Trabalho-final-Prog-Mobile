import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todos/models/todo-item.model.dart';

import '../user.dart';

class TodoRepository {
  Future<List<TodoItem>> getTodayTodos() async {
    var url = "http://192.168.0.9:3000/v1/todos/undone/today";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getTomorrowTodos() async {
    var url = "http://192.168.0.9:3000/v1/todos/undone/tomorrow";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getAll() async {
    var url = "http://192.168.0.9:3000/v1/todos";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );
    var teste = (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
    return teste;
  }

  Future<TodoItem> add(TodoItem item) async {
    var url = "http://192.168.0.9:3000/v1/todos";

    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<TodoItem> markAsDone(TodoItem item) async {
    var url = "http://192.168.0.9:3000/v1/todos/mark-as-done";

    try {
      Response response = await Dio().put(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
