import 'package:flutter/material.dart';
void main(){
  runApp(MyApp(title: "state less"));
}
class MyApp extends StatelessWidget {
  String title = "";
  MyApp({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyStateFull(),
      ),
    );
  }
}
class MyStateFull extends StatefulWidget {
  const MyStateFull({super.key});

  @override
  State<MyStateFull> createState() => _MyStateFullState();
}

class _MyStateFullState extends State<MyStateFull> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Counter $counter",style: TextStyle(fontSize: 16),),
        SizedBox(height: 16,),
        ElevatedButton(onPressed: (){
          setState(() {
            counter++;
          });
        }, child: Icon(Icons.add))
      ],
    );
  }
}

