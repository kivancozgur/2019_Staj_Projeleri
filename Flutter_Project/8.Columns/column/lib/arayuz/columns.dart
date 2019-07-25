import 'package:flutter/material.dart';

class Columnslar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        color: Colors.red,
        child: new Container(
          color: Colors.brown,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection:TextDirection.ltr,
            verticalDirection: VerticalDirection.down,
            textBaseline:TextBaseline.alphabetic, 
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                verticalDirection: VerticalDirection.down,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    color: Colors.orange.shade900,
                    margin: EdgeInsets.all(5.0),
                    child: new Text(
                      "Merhaba",
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    color: Colors.yellow.shade900,
                    margin: EdgeInsets.all(5.0),
                    child: new Text(
                      "Merhaba",
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                verticalDirection: VerticalDirection.down,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    color: Colors.green.shade600,
                    margin: EdgeInsets.all(5.0),
                    child: new Text(
                      "Merhaba",
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan.shade900,
                    margin: EdgeInsets.all(5.0),
                    child: new Text(
                      "Merhaba",
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
