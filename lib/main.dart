import 'package:flutter/material.dart';
import 'core/styles/app_colors.dart';
import 'feature/tailed_beasts/ui/tailed_beasts_page.dart';

void main() {
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