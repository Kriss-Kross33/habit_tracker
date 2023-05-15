import 'package:flutter/material.dart';
import 'package:habit_tracker/persistence/hive_data_store.dart';
import 'package:habit_tracker/ui/home/task_grid_page.dart';
import 'package:hive/hive.dart';

import '../../models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataStore = HiveDataStore();

    return ValueListenableBuilder(
        valueListenable: dataStore.taskListenable(),
        builder: (_, Box<Task> box, __) {
          return TaskGridPage(
            tasks: box.values.toList(),
          );
        });
  }
}
