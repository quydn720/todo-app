import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/tasks/components/body.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Icon(
              Icons.list,
            ),
          ],
        ),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
