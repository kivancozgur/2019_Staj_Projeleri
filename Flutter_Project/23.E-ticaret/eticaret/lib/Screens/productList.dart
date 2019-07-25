import 'package:eticaret/Screens/product.dart';
import 'package:eticaret/Screens/productDetail.dart';
import 'package:eticaret/db/dbHelper.dart';
import 'package:eticaret/widgets/ProductListRow.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  BuildContext context;
  DbHelper dbHelper=new DbHelper();
  List<Product> products;
  int count=0;
  @override
  Widget build(BuildContext context) {
    if(products==null){
      products=new List<Product>();
      getData();
    }
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Ticaret",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildProductListPage(),
    );
  }
void getData(){
  var dbFuture=dbHelper.initializeDb();
  dbFuture.then((result){
    var productsFuture=dbHelper.getProducts();
    productsFuture.then((data){
      List<Product>productsData=new List<Product>();
      count=data.length;
      for(int i=0;i<count;i++){
        productsData.add(Product.fromObject(data[i]));
      }
      // setState((){
      //   products=productsData;
      //   count=count;
      // });
    });
  });
}
  _buildProductListPage() {

    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context,int position) {
        if (position == 0) {
          // return Card(
            
          // _buildFilterWidgets(screenSize),
          // );
        } else if (position == 4) {
          return SizedBox(
            height: 12.0,
          );
        } else {
          return _buildProductListRow();
        }
      },
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(10),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOrderButton("Sırala"),
              Container(
                color: Colors.grey[400],
                width: 0.8,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
              Container(
                color: Colors.grey[400],
                width: 0.8,
                height: 24.0,
              ),
              _buildViewButton("Görünüm"),
              Container(
                color: Colors.grey[400],
                width: 0.8,
                height: 24.0,
              ),
              _buildSearchButton("Ara"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.filter_list,
            color: Colors.grey[400],
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildViewButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.view_quilt,
            color: Colors.grey[400],
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildSearchButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildOrderButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey[400],
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }
}

_buildProductListRow() {
  return ProductListRow(
      name: "Kazak",
      currentPrice: 150,
      originalPrice: 300,
      discount: 50,
      imageUrl:
          "https://www.dilvin.com.tr/productimages/112450/original/101a02233_lila.jpg");
}
