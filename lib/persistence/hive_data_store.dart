import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class HiveDataStore {
  static const taskBoxName = 'tasks';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Task>(TaskAdapter());
    await Hive.openBox<Task>(taskBoxName);
  }

  Future<void> createDemoTask(
      {required List<Task> tasks, bool force = false}) async {
    final box = Hive.box<Task>(taskBoxName);
    if (box.isEmpty || force) {
      await box.clear();
      await box.addAll(tasks);
    }
  }

  ValueListenable<Box<Task>> taskListenable() {
    return Hive.box<Task>(taskBoxName).listenable();
  }
}

final dataStoreProvider = Provider<HiveDataStore>((ref) {
  throw UnimplementedError();
});
