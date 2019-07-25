
import 'package:eticaret/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/Screens/productDetail.dart';
class Routes{
  static final routes=<String,WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL:(BuildContext context)=>ProductDetail()
  };
}