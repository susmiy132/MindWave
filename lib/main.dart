
import 'package:flutter/material.dart';
import 'package:mindwave/app/app.dart';
import 'package:mindwave/app/service_locator/service_locator.dart';
import 'package:mindwave/core/network/hive_service.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await initDependencies();
  runApp(App() 
  );
}