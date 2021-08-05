import 'package:flutter/material.dart';
import 'package:todo_app/screens/tasks/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData.dark(),
      home: TasksScreen(),
    );
  }
}
