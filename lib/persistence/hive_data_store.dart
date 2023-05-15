import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class HiveDataStore {
  static const taskBoxName = 'tasks';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Task>(TaskAdapter());
    await Hive.openBox<Task>(taskBoxName);
  }
}
