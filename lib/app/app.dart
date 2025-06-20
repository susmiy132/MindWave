
import 'package:flutter/material.dart';
import 'package:mindwave/app/theme/theme_data.dart';
import 'package:mindwave/features/splash/presentation/view/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: getApplicationTheme(),
    );
  }
}