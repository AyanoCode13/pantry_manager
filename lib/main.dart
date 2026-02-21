import 'package:flutter/material.dart';
import 'package:meal_planner/config/providers/app.providers.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final providers = await appProviders;
  runApp(MultiProvider(providers: providers, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
