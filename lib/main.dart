import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      initialRoute: '/', 
      routes: {
        '/': (context) => Homepage(), 
        '/quiz': (context) => Quiz(), 
        '/resultados': (context) => Resultados(), 
      },
    );
  }
}