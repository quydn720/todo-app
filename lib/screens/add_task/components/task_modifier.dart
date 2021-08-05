import 'package:flutter/material.dart';

class TaskModifier extends StatelessWidget {
  final IconData icon;
  final String content;

  const TaskModifier({
    Key? key,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: Text(content),
          onTap: () {},
        ),
      ],
    );
  }
}
