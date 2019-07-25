import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text("Ürün İnceleme", style: TextStyle(color: Colors.black)),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imageController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imageController,
                  children: <Widget>[
                    Image.network(
                        "https://cdn-gap.akinon.net/products/2018/10/11/84846/61128184-614c-4cc8-808a-8bc55b772d70_size520x693_cropCenter.jpg"),
                    Image.network(
                        "https://cdn-phoh.akinon.net/products/2018/07/05/294144/eff67aca-6ec5-4629-9f1b-85c6fa03bd33.jpg"),
                    Image.network(
                        "https://kv9wxco8.rocketcdn.com/Content/global/images/products/TK096E9K13/erkek-tribun-degrade-kazak.jpg?v=1"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 1.1),
                  child: TabPageSelector(
                    controller: imageController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 19.0),
      child: Center(
        child: Text(
          "Jack Jones Kazak",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text("\$ 100", style: TextStyle(fontSize: 16.0, color: Colors.black)),
          SizedBox(
            width: 8.0,
          ),
          Text("\$ 200",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough)),
          SizedBox(
            width: 8.0,
          ),
          Text("\%50 indirim",
              style: TextStyle(fontSize: 12.0, color: Colors.blue)),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text("Daha fazla bilgi için tıklayınız",
              style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden : M",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Beden Tablosu",
                style: TextStyle(fontSize: 12.0, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Yıkama Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  "%60 Pamuk, %40 Polyester",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "30 derece makinada renkli yıkama",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("İstek", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.card_travel,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("Sepete Ekle", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
