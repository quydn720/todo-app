import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/add_task/components/task_modifier.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String taskTitle;

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskModel>(context);
    return Consumer<TaskModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'What are you planning?',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        taskTitle = value;
                      },
                    ),
                    TaskModifier(
                      content: 'May 29, 14:00',
                      icon: Icons.notifications_none_outlined,
                    ),
                    TaskModifier(
                      icon: Icons.content_paste,
                      content: 'Add note',
                    ),
                    TaskModifier(
                      icon: Icons.assignment_ind,
                      content: 'Category',
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                tasks.add(Task(
                  isCompleted: false,
                  title: taskTitle,
                ));
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
