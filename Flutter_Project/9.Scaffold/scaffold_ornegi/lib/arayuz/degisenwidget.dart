import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<HomePage> {
  int degisenSayi = 0;
  void sayiyiArtir() {
    setState(() {
      degisenSayi++;
    });
  }

  void sayiyiAzalt() {
    setState(() {
      degisenSayi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful-Stateles Dersi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                color: Colors.green,
                child: Text("Arttır"),
                onPressed: sayiyiArtir),
            Text(
              "$degisenSayi",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 20.0,
                color: degisenSayi > 0 ? Colors.green : Colors.red,
              ),
            ),
            FlatButton(
              color: Colors.red,child: Text("Azalt"), onPressed: sayiyiAzalt),
          ],
        ),
      ),
    );
  }
}
