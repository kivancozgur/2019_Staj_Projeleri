import 'package:flutter/material.dart';

class ImageViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageView"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
              "INTERNETTEN LOADING RESMI",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
            image:"https://halikoy.com/wp-content/uploads/2018/05/sanat-hali-doku-1093.jpg"),
            Text(
              "ASSET RESMI",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset("assets/images/safak.jpg"),
            Text(
              "INTERNET RESMI",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.network("https://halikoy.com/wp-content/uploads/2018/05/sanat-hali-doku-1093.jpg"),
            
          ],
        ),
      ),
    );
  }
}
