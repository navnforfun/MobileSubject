import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  var id;
  var tenbaihat;
  var casy;
  var tacgia;
  var theloai;
  var duongdan;
  var loibaihat;
  var luotnghe;

  Product({
    required this.id,
    required this.tenbaihat,
    required this.casy,
    required this.tacgia,
    required this.theloai,
    required this.duongdan,
    required this.loibaihat,
    required this.luotnghe,
  });
}

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<Product> products;

  @override
  void initState() {
    super.initState();
    products = [];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    var res = await http.get(Uri.parse('http://localhost/apiphp/api.php'));
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      setState(() {
        products = convertMapToList(data);
        //    print(products);
      });
    } else {
      throw Exception("Erro went fetch ");
    }
  }

  // viet ham convert
  List<Product> convertMapToList(Map<String, dynamic> data) {
    List<Product> productList = [];
    //print(data);
    data.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        Product p = Product(
            id: value[i]["id"],
            tenbaihat: value[i]["tenbaihat"],
            casy: value[i]["casy"],
            tacgia: value[i]["tacgia"],
            theloai: value[i]["theloai"],
            duongdan: value[i]["duongdan"],
            loibaihat: value[i]["loibaihat"],
            luotnghe: value[i]["luotnghe"]);
        productList.add(p);
      }
    });
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch List Song ")),
      body: products != null
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(products[index].tenbaihat),
                    subtitle: Column(
                      children: [
                        Text(products[index].tacgia),
                        Text(products[index].theloai),
                      ],
                    ),
                    leading: Image.network(
                      "https://t3.ftcdn.net/jpg/04/54/66/12/360_F_454661277_NtQYM8oJq2wOzY1X9Y81FlFa06DVipVD.jpg",
                      width: 50,
                      height: 50,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetail(
                                  product: products[index],
                                ))));
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          // Image(image: )
          Text(product.tenbaihat),

          Text(product.tacgia),
          Text(product.duongdan),
          Text(product.loibaihat),
          Text("Luot nghe: " + product.luotnghe)
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductListScreen()));
          },
          child: Text("Go to list screen"),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
