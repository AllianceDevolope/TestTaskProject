import 'package:flutter/material.dart';
import 'package:test_task_project/application/markets/presentation/screens/coins_screen.dart';
import 'package:test_task_project/core/services/dependency_service.dart';

void main() {
  initializeDependencies();
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MarketsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
