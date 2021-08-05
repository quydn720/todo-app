import 'package:flutter/material.dart';
import 'TaskCheckbox.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        '20:15 - April 29',
        style: TextStyle().copyWith(
          color: Colors.black54,
        ),
      ),
      title: Text(
        'Call Max',
        style: TextStyle().copyWith(
            fontWeight: FontWeight.w500,
            color: isChecked ? Colors.blue : Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        onTapCallback: (newValue) {
          setState(() {
            isChecked = newValue!;
          });
        },
      ),
    );
  }
}
