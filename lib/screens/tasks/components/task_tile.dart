import 'package:flutter/material.dart';
import 'task_checkbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String? time;
  final Function(bool?) checkboxCallback;

  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.title,
      this.time,
      required this.checkboxCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String displayTime = time ?? '';
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
      title: Text(
        title,
        style: const TextStyle().copyWith(
          fontWeight: FontWeight.w500,
          color: isChecked ? Colors.blue : Colors.black,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        displayTime,
        style: const TextStyle().copyWith(
          color: Colors.black54,
        ),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        onTapCallback: checkboxCallback,
      ),
    );
  }
}
