import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Task {
  String title;
  String? time;
  bool isCompleted;
  Task({required this.isCompleted, required this.title, this.time});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Call Max', time: '20:15 - April 29', isCompleted: true),
    Task(title: 'Practice piano', time: '16:00', isCompleted: false),
    Task(title: 'Learn Spanish', time: '17:00', isCompleted: true),
    Task(title: 'Learn Spanish', time: null, isCompleted: false),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleCompleted();
    notifyListeners();
  }
}
