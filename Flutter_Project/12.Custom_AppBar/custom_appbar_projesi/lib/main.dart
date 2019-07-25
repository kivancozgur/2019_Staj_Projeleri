import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var divheight=MediaQuery.of(context).size.height;
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF950400),
              Color(0xFFB10900),
              Color(0xFF950400),
            ]
          ),
          boxShadow: [
            new BoxShadow(color: Colors.black,blurRadius: 10.0)
          ],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
        ),
        height: divheight/2*0.3,
         child: Row(
          children: <Widget>[
          Expanded(child:Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.list),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Icon(Icons.account_balance_wallet),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Icon(Icons.account_circle),
        ),
        Padding(
          padding: const EdgeInsets.only(right:28.0),
          child: new Icon(Icons.account_balance_wallet),
        ),
            
         ],
        ),
        ),
    );
       
  }
}
