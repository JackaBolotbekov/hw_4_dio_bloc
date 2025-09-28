import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/styles/app_colors.dart';
import 'feature/tailed_beasts/model/tailed_beast.dart';
import 'feature/tailed_beasts/ui/tailed_beasts_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TailedBeastAdapter());
  await Hive.openBox<TailedBeast>('tailed_beasts_box');

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хвастатые',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const TailedBeastsPage(),
    );
  }
}