import 'package:flutter/material.dart';
import 'package:rentacar_project/bloc/state_bloc.dart';
import 'package:rentacar_project/bloc/state_provider.dart';
import 'model/car.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

var seciliAraba = carList.arabalar[0];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 25),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: LayoutStarts(),
    );
  }
}

class LayoutStarts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarDetailsAnimation(),
        CustomBottomSheet(),
        RentButton(),
      ],
    );
  }
}
class RentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: FlatButton(
          onPressed: (){},
          child: Text(
            "Aracı Kirala",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.4,
              fontFamily: "arial"),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
            ),
            color: Colors.black,
            padding: EdgeInsets.all(25),
          ),
        ),
      );
  }
}
class CarDetailsAnimation extends StatefulWidget {
  @override
  _CarDetailsAnimationState createState() => _CarDetailsAnimationState();
}

class _CarDetailsAnimationState extends State<CarDetailsAnimation> with TickerProviderStateMixin{
  AnimationController fadeController;
  AnimationController scaleController;
  Animation fadeAnimation;
  Animation scaleAnimation;
  @override
  void initState() {
    super.initState();
    fadeController=
      AnimationController(duration: Duration(milliseconds: 180),vsync: this);
    scaleController=
      AnimationController(duration: Duration(milliseconds: 350),vsync: this);
    fadeAnimation=Tween(begin: 0.0,end: 1.0).animate(fadeController);
    scaleAnimation=Tween(begin: 0.8,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: scaleController,
      reverseCurve: Curves.easeInOut,
      ));
  }

  forward(){
    scaleController.forward();
    fadeController.forward();
  }
  reverse(){
    scaleController.reverse();
    fadeController.reverse();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      initialData: StateProvider().isAnimating,
      stream: stateBloc.animationStatus,
      builder: (context, snapshot) {
        snapshot.data?forward():reverse();
        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(child: CarDetails(),opacity: fadeAnimation,),
        );
      }
    );
  }
}

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: _carTitle(),
          ),
          Container(
            width: double.infinity,
            child: CarCarousel(),
          )
        ],
      ),
    );
  }
}

_carTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.white, fontSize: 38),
            children: [
              TextSpan(text: seciliAraba.firmaAdi),
              TextSpan(text: "\n"),
              TextSpan(
                  text: seciliAraba.aracAdi,
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ]),
      ),
      SizedBox(height: 10),
      RichText(
        text: TextSpan(style: TextStyle(fontSize: 16), children: [
          TextSpan(
              text: seciliAraba.fiyat.toString(),
              style: TextStyle(color: Colors.grey[20])),
          TextSpan(text: " / günlük", style: TextStyle(color: Colors.grey)),
        ]),
      )
    ],
  );
}

class CarCarousel extends StatefulWidget {
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = seciliAraba.imgList;
  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
        child: Image.asset("assets/$assetName", fit: BoxFit.fitWidth));
  }).toList();

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            height: 250,
            viewportFraction: 1.0,
            items: child,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _map<Widget>(imgList, (index, assetName) {
                  return Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                        color: _current == index
                            ? Colors.grey[100]
                            : Colors.grey[600]),
                  );
                }),
              ))
        ],
      ),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> with SingleTickerProviderStateMixin{
  double sheetTop = 400;
  double minSheetTop = 30;
  Animation<double>animation;
  AnimationController controller;
  @override
  void initState() {
    
    super.initState();
  controller=AnimationController(duration: const Duration(milliseconds: 200),vsync: this);
  animation=Tween<double>(begin: sheetTop,end: minSheetTop).animate(
    CurvedAnimation(parent: controller,
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut)
  )..addListener((){
    setState(() {});
  });
  }
  forwardAnimation(){
    controller.forward();
    stateBloc.toggleAnimation();
  }
  reverseAnimation(){
    controller.reverse();
    stateBloc.toggleAnimation();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: animation.value,
      left: 0,
      child: GestureDetector(
        onTap: () {
          controller.isCompleted?reverseAnimation():forwardAnimation();
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails){
          if(dragEndDetails.primaryVelocity<0.0){
            forwardAnimation();
          }
          else if(dragEndDetails.primaryVelocity> 0.0){
            reverseAnimation();
          }
          else{
            return;
          }
        },
        child: SheetContainer(),
      ),
    );
  }
}
class SheetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sheetItemHeight=110;
    return Container(
      padding: EdgeInsets.only(top:25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      color: Color(0xfff1f1f1)
      ),
      child: Column(children: <Widget>[
        drawerHandle(),
        Expanded(
          flex: 1,
          child: ListView(children: <Widget>[
            offerDetails(sheetItemHeight),
            features(sheetItemHeight),
            specification(sheetItemHeight),
          ],),
        )
      ],),
    );
  }
}
drawerHandle(){
  return Container(
    margin: EdgeInsets.only(bottom: 25),
    height: 3,
    width: 65,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
    color: Color(0xffd9dbdb)
    ),
  );
}
offerDetails(double sheetItemHeight){
  return Container(
    padding: EdgeInsets.only(top: 15,left: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        "Araç Bilgileri",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: sheetItemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seciliAraba.siparisDetayi.length,
            itemBuilder: (context,index){
              return ListItem(
                sheetItemHeight:sheetItemHeight,
                mapVal:seciliAraba.siparisDetayi[index],
              );
            },
          ),
          )
    ],),
  );
}
features(double sheetItemHeight){
  return Container(
    padding: EdgeInsets.only(top: 15,left: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        "Features",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: sheetItemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seciliAraba.ozellikler.length,
            itemBuilder: (context,index){
              return ListItem(
                sheetItemHeight:sheetItemHeight,
                mapVal:seciliAraba.ozellikler[index],
              );
            },
          ),
          )
    ],),
  );
}
specification(double sheetItemHeight){
  return Container(
    padding: EdgeInsets.only(top: 15,left: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        "Sözleşme",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: sheetItemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: seciliAraba.sozlesme.length,
            itemBuilder: (context,index){
              return ListItem(
                sheetItemHeight:sheetItemHeight,
                mapVal:seciliAraba.sozlesme[index],
              );
            },
          ),
          )
    ],),
  );
}
class ListItem extends StatelessWidget {
  final double sheetItemHeight;
  final Map mapVal;
  ListItem({
    this.sheetItemHeight,
    this.mapVal
  });

  @override
  Widget build(BuildContext context) {
    var innerMap;
    bool isMap;
    if(mapVal.values.elementAt(0) is Map){
      innerMap=mapVal.values.elementAt(0);
      isMap=true;
    }
    else{
      innerMap=mapVal;
      isMap=false;
    }
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(15), 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            mapVal.keys.elementAt(0),
            isMap?Text(innerMap.keys.elementAt(0),textAlign: TextAlign.center,style: TextStyle(color: Colors.black,letterSpacing: 1.2,fontSize: 11)):
            Container(

            ),
            Text(
              mapVal.values.elementAt(0),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),
            ),
          ],
          ),
    );
  }
}