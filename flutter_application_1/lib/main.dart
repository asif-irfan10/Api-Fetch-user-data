import 'package:flutter/material.dart';
import 'package:flutter_application_1/userData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter USerDAta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
    useMaterial3: true
      ),
      home: const MyWidget(),
      
    );
  }
}

