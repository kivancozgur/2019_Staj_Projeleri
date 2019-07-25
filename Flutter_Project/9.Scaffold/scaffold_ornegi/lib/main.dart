import 'package:scaffold_ornegi/arayuz/scaffold_ornek.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_ornegi/arayuz/degisenwidget.dart';
import 'package:scaffold_ornegi/arayuz/imageview.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context)=>ScaffoldOrnek(),
        "/degisenwidget":(context)=>HomePage(),
        "/imageview":(context)=>ImageViews(),
      },
    ),
  );
}
