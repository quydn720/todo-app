class Task {
  String title;
  String? time;
  bool isCompleted;
  Task({required this.isCompleted, required this.title, this.time});
}

List<Task> tasks = [
  Task(title: 'Call Max', time: '20:15 - April 29', isCompleted: true),
  Task(title: 'Practice piano', time: '16:00', isCompleted: false),
  Task(title: 'Learn Spanish', time: '17:00', isCompleted: false),
];
