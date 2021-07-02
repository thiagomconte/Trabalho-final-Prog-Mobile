import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todos/components/avatar.widget.dart';
import 'package:todos/components/button.widget.dart';
import 'package:todos/stores/app.store.dart';
import 'package:todos/themes/app.theme.dart';
import 'package:todos/views/createtodo.view.dart';
import 'package:todos/views/home.views.dart';
import 'package:todos/views/login.views.dart';
import 'package:provider/provider.dart';

// Esta classe permite acesso ao LocalHost com certificados HTTPS inválidos

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        home: LoginView(),
      ),
    );
  }
}
