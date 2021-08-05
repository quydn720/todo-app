import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/tasks/components/task_tile.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.fact_check_outlined,
                  color: Colors.lightBlue,
                ),
              ),
              Text(
                'All',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text('${Provider.of<TaskModel>(context).tasks.length} Tasks'),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 24.0),
            child: Consumer<TaskModel>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var task = value.tasks[index];
                    return TaskTile(
                      isChecked: task.isCompleted,
                      title: task.title,
                      time: task.time,
                      checkboxCallback: (checkboxState) {
                        value.updateTask(task);
                      },
                    );
                  },
                  itemCount: value.tasks.length,
                );
              },
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
