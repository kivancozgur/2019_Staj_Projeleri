import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.red,
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                color:Colors.green.shade400,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Merhaba",
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Container(
                alignment: Alignment.center,
                color:Colors.cyan.shade400,
                margin: EdgeInsets.all(5.0),
                child: new Text(
                  "Merhaba",
                  textDirection: TextDirection.ltr,
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}
