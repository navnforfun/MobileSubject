import 'package:flutter/material.dart';
Future<int> layDuLieu() async{
  await Future.delayed(Duration(seconds: 2));
  return 50;

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
            body: FutureBuilder<int>(
              future: layDuLieu(),
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
