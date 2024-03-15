import 'package:flutter/material.dart';
class MyInheritWidget extends InheritedWidget{
  final int data;
  MyInheritWidget({required this.data, required Widget child}) : super(child: child);
  // check update
  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
    return oldWidget.data != data;
  }
  // phuong thuc lay du lieu tu context
  static MyInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritWidget>();
  }
}
// su dung
void main () => runApp(MyInheritWidget(data: 50, child: MyApp()));
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data =MyInheritWidget.of(context)?.data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Du lieu: $data"),
        SizedBox(height: 30,),
        MyChild()
      ],
    );
    return const Placeholder();
  }
}

class MyChild extends StatelessWidget {
  const MyChild({super.key});

  @override
  Widget build(BuildContext context) {
    final data =MyInheritWidget.of(context)?.data;

    return Text("Du lieu tu lop cao nhat: $data");
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Vi du ve chuyen du lieu"),),
        body: MyWidget(),
      ),
    );
  }
}
