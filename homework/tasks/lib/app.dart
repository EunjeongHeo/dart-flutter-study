import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tasks',
      theme: ThemeData(
        useMaterial3: true,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(name: '은정'),
    );
  }
}
