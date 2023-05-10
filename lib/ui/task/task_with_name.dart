import 'package:flutter/material.dart';
import 'package:habit_tracker/models/task_preset.dart';
import 'package:habit_tracker/ui/task/task.dart';

import '../../costants/constants.dart';
import '../../themes/app_theme.dart';

class TaskWithName extends StatelessWidget {
  const TaskWithName({
    super.key,
    required this.task,
  });

  final TaskPreset task;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedTask(
            iconName: task.iconName,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          task.name.toUpperCase(),
          textAlign: TextAlign.center,
          style:
              TextStyles.taskName.copyWith(color: AppTheme.of(context).accent),
        )
      ],
    );
  }
}
