import 'package:flutter/material.dart';
import 'package:task_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
