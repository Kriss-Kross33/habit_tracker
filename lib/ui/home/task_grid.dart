import 'package:flutter/material.dart';
import 'package:habit_tracker/models/task_preset.dart';
import 'package:habit_tracker/ui/task/task_with_name.dart';

class TaskGrid extends StatelessWidget {
  const TaskGrid({super.key, required this.tasks});

  final List<TaskPreset> tasks;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWithName(
          task: tasks[index],
        );
      },
    );
  }
}
