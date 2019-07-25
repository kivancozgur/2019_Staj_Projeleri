import 'package:eticaret/Screens/product.dart';
import 'package:eticaret/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/Screens/productList.dart';
import 'package:eticaret/utilities/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Product>products=new List<Product>();
    DbHelper dbHelper=new DbHelper();
    dbHelper.initializeDb().then((result)=>dbHelper.getProducts()
    .then((result)=>products=result));
    
    Product product=new Product("Mouse","A4 Tech wireless Mouse",30);
    dbHelper.insert(product);
    
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
