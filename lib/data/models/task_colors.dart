import 'package:flutter/material.dart';

class TaskColors {
  int ID;
  Color? color;
  bool? isSelected;

  TaskColors({required this.ID, this.color, this.isSelected});

  static List<TaskColors> fillTaskColors() {
    List<TaskColors> taskColors = [];

    taskColors.add(TaskColors(ID: 1, color: Color(0xFFFF5246), isSelected: true));

    taskColors.add(TaskColors(ID: 2, color: Color(0xFFFF9D43), isSelected: false));

    taskColors.add(TaskColors(ID: 3, color: Color(0xFFF9C60a), isSelected: false));

    taskColors.add(TaskColors(ID: 4, color: Color(0xFF429FFe), isSelected: false));

    return taskColors;
  }
}
