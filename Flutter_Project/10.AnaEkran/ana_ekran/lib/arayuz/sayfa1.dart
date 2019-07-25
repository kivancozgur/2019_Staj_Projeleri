import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Sayfa1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: new AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Ana Sayfa'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '3.Tıklandı',
            onPressed: () => print("3.Tıklandı"),
          ),
        ],
      ),
      body: new Center(
        child: new GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/sayfa2");
              },
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/safak.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          color: Color(0xCDFFFFFF),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0))),
                      child: new Text(
                        "ŞAFAK ÇEBİN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, "/sayfa2"),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/kivanc.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          color: Color(0xCDFFFFFF),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0))),
                      child: new Text(
                        "KIVANÇ ÖZGÜR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, "/degisenwidget"),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/oktay.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          color: Color(0xCDFFFFFF),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0))),
                      child: new Text(
                        "OKTAY KAYPAK",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, "/degisenwidget"),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/deniz.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          color: Color(0xCDFFFFFF),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0))),
                      child: new Text(
                        "DENİZHAN ERTAL",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("Anasayfa")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_basket),
              title: new Text("Sepetim")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_box), title: new Text("Profil")),
        ],
        onTap: (int i) {
          switch (i) {
            case 0:
              debugPrint("Ekle");
              break;
            case 1:
              debugPrint("Sil");
              break;
            default:
              debugPrint("İsimsiz");
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Kıvanç Özgür'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kivanc.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.red.shade600,
              ),
            ),
            ListTile(
              title: Text('Kullanıcılar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Hesaplar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Çıkış'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
