import 'package:flutter/material.dart';

class ScaffoldOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: new AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('BSM 3.SINIF'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: '1.Tıklandı',
            onPressed: () => Navigator.pushNamed(context, "/"),
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: '2.Tıklandı',
            onPressed: () => Navigator.pushNamed(context, "/degisenwidget"),
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
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
              onTap: () => Navigator.pushNamed(context, "/imageview"),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://halikoy.com/wp-content/uploads/2018/05/sanat-hali-doku-1093.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Color(0xCDFFFFFF),
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
              onDoubleTap: () => Navigator.pushNamed(context, "/degisenwidget"),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/kivanc.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(5.0),
                  child: Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Color(0xCDFFFFFF),
                      child: new Text(
                        "KIVANÇ ÖZGÜR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            new GestureDetector(
              onTap: (){
           
              },
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    margin: EdgeInsets.all(5.0),
                    child: new Text("SELİN SAĞLAM"))),
            new Container(
                alignment: Alignment.center,
                color: Colors.orange,
                margin: EdgeInsets.all(5.0),
                child: new Text("OKTAY KAYPAK")),
            new Container(
                alignment: Alignment.center,
                color: Colors.pink[300],
                margin: EdgeInsets.all(5.0),
                child: new Text("ÖZLEM AKBABA")),
            new Container(
                alignment: Alignment.center,
                color: Colors.purple,
                margin: EdgeInsets.all(5.0),
                child: new Text("ŞEVVAL ERKILINÇ")),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Ekle")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.close), title: new Text("Sil")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.info), title: new Text("Bilgi")),
        ],
        onTap: (int i) {
          switch (i) {
            case 0:
              debugPrint("Ekle");
              break;
            case 1:
              debugPrint("Sil");
              break;
            case 2:
              debugPrint("Bilgi");
              break;
            default:
              debugPrint("İsimsiz");
              break;
          }
        },
      ),
      drawer: new Drawer(
        child: ListTile(
          leading: Icon(Icons.change_history),
          title: Text('Change history'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
