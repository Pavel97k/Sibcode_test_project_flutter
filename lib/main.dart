import 'package:flutter/material.dart';
import 'package:test_project_subicode/presentation/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.orange,
              onPrimary: Colors.white,
              secondary: Colors.green.shade200,
              onSecondary: Colors.white,
              error: Colors.red.shade300,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black)),
      home: const SplashScreen(),
    );
  }
}
