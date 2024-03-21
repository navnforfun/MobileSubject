import 'package:flutter/material.dart';
Stream<int> layDuLieu() async* {
  for (int i = 1; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
  void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: StreamBuilder<int>(
              stream: layDuLieu(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else if(snapshot.hasError){
                  return Text("Loi: ${snapshot.error}");
                }else{
                  return Text("Du lieu nguoi dung ${snapshot.data}");
                }
              },
            )
        )
    );
  }
}
