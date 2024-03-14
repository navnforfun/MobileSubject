import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyApp widget",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
        ),
        body: Container(
          child: Text("Jo"),
        ),
      ),
    );
  }
}

