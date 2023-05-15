import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/persistence/hive_data_store.dart';
import 'package:habit_tracker/ui/home/task_grid_page.dart';
import 'package:hive/hive.dart';

import '../../models/models.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return ValueListenableBuilder(
        valueListenable: dataStore.taskListenable(),
        builder: (_, Box<Task> box, __) {
          return TaskGridPage(
            tasks: box.values.toList(),
          );
        });
  }
}
