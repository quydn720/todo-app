import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onTapCallback;

  const TaskCheckbox(
      {Key? key, required this.isChecked, required this.onTapCallback})
      : super(key: key);
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black26;
    }
    if (isChecked) return Colors.lightBlueAccent;
    return Colors.black26;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5),
      ),
      fillColor: MaterialStateColor.resolveWith(getColor),
      checkColor: Colors.white,
      onChanged: onTapCallback,
      value: isChecked,
    );
  }
}
