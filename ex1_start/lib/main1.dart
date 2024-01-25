import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCalculator(),
    );
  }
}

//activity
class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCalculatorState();
  }
}

// lop quan ly trang thai
class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController num1C = TextEditingController();
  TextEditingController num2C = TextEditingController();
  // bien luu ket qua tinh toan
  String kq = '';
  // ham tinh tong va cap nhat trang thai
  void calculatorSum() {
    // lay gia tri tu 2 o nhap lieu
    double num1 = double.tryParse(num1C.text) ?? 0.0;
    double num2 = double.tryParse(num2C.text) ?? 0.0;
    double num = num1 + num2;
    // cap nhat trang thai
    setState(() {
      kq = "Tong: $num";
    });
  }

  // giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinh tong "),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text 1
            TextField(
              controller: num1C, // gan voi so 1
              keyboardType: TextInputType.number, // chi nhap so
              decoration: InputDecoration(labelText: "Nhap so 1 "),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: num2C, // gan voi so 1
              keyboardType: TextInputType.number, // chi nhap so
              decoration: InputDecoration(labelText: "Nhap so 2 "),
            ),
            SizedBox(
              height: 20.0,
            ),
            // button click
            ElevatedButton(onPressed: calculatorSum, child: Text("Tinh tong")),
            SizedBox(
              height: 20.0,
            ),
            // Hien thi ket qua
            Text(
              kq,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[500],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
