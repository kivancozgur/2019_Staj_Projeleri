
import 'package:flutter/material.dart';
import 'arayuz/sayfa1.dart';
import 'arayuz/sayfa2.dart';
void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context)=>Sayfa1(),
        "/sayfa2":(context)=>Sayfa2(),
      },
    ),
  );
}
