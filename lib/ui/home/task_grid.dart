import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/models/task_preset.dart';
import 'package:habit_tracker/ui/task/task_with_name.dart';

class TaskGrid extends StatelessWidget {
  const TaskGrid({super.key, required this.tasks});

  final List<TaskPreset> tasks;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final crossAxisSpacing = constraints.maxWidth * 0.05;
      final taskWidth = (constraints.maxWidth - crossAxisSpacing) / 2;
      const aspectRatio = 0.82;
      final taskHeight = taskWidth / aspectRatio;
      final mainAxisSpacing =
          max((constraints.maxHeight - taskHeight * 3) / 2.0, 0.1);
      final taskLength = tasks.length;
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: aspectRatio,
        ),
        itemCount: taskLength,
        itemBuilder: (context, index) {
          return TaskWithName(
            task: tasks[index],
          );
        },
      );
    });
  }
}
