import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/models.dart';
import 'package:habit_tracker/persistence/hive_data_store.dart';
import 'package:habit_tracker/themes/app_theme.dart';
import 'package:habit_tracker/ui/ui.dart';

import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();
  await dataStore.createDemoTask(tasks: [
    Task.create(name: 'Wash Your Hands', iconName: AppAssets.washHands),
    Task.create(name: 'Wear a Mask', iconName: AppAssets.mask),
    Task.create(name: 'Brush Your Teeth', iconName: AppAssets.toothbrush),
    Task.create(name: 'Floss Your Teeth', iconName: AppAssets.dentalFloss),
    Task.create(name: 'Drink Water', iconName: AppAssets.water),
    Task.create(name: 'Practice Instrument', iconName: AppAssets.guitar),
  ]);
  runApp(
    ProviderScope(
      overrides: [dataStoreProvider.overrideWithValue(dataStore)],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: HomePage(),
      ),
    );
  }
}
