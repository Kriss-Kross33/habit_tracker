import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_assets.dart';
import 'package:habit_tracker/ui/home/task_grid_page.dart';

import '../../models/task_preset.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskGridPage(
      tasks: const [
        TaskPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
        TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
        TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
        TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
        TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
        TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
      ],
    );
  }
}
