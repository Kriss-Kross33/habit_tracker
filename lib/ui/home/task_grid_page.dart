import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/home/task_grid.dart';

import '../../models/models.dart';
import '../../themes/app_theme.dart';

class TaskGridPage extends StatelessWidget {
  const TaskGridPage({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: SafeArea(
        child: TaskGridContents(tasks: tasks),
      ),
    );
  }
}

class TaskGridContents extends StatelessWidget {
  const TaskGridContents({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: TaskGrid(
        tasks: tasks,
      ),
    );
  }
}
