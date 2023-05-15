import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/task/task.dart';

import '../../constants/constants.dart';
import '../../models/models.dart';
import '../../themes/app_theme.dart';

class TaskWithName extends StatelessWidget {
  const TaskWithName({
    super.key,
    required this.task,
  });

  final Task task;

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
