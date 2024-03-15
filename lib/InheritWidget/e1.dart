import 'package:flutter/material.dart';
class MyInheritWidget extends InheritedWidget{
  final int data;
  MyInheritWidget({required this.data, required Widget child}) : super(child: child);
  // check update
  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
   return oldWidget.data != data;
  }
  // phuong thuc lay du lieu tu con text
static MyInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritWidget>();
}

}
// dinh nghia widget con su dung My InheritWidget
class MyWidget extends StatelessWidget {

  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MyInheritWidget.of(context)?.data;
    return Text("Du lieu tu cha: $data");

  }
}
// dinh nghia widget chua
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyInheritWidget(
        data: 40,
        child: MyWidget(),
      ),
    );
  }
}
void main() => runApp(MyApp());

