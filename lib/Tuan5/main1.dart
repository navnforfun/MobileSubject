import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyState(title: "Ngoc Anh") ,
    );
  }
}

class MyState extends StatefulWidget {
  final String title;
  const MyState({super.key,required this.title});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        children: [

          Text("Counter: ${counter}"),

          ElevatedButton(onPressed: (){
            setState(() {
              counter++;
            });
          }, child: Icon(Icons.add))
        ],
      ),
    );
  }
}

