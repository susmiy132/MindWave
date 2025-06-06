
import 'package:flutter/material.dart';
import 'package:mindwave/bottom_navigation/dashboard.dart';
import 'package:mindwave/theme/theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardBottomScreen(),
      theme: getApplicationTheme(),
    );
  }
}