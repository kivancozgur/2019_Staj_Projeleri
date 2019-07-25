import 'package:flutter/material.dart';

CarList carList = CarList(arabalar: [
  Car(firmaAdi: "Renault", aracAdi: "Clio", fiyat: 200, imgList: [
    "rclio.png",
    "rclioyan.png",
    "rclioyan2.png",
    "clioarka.png",
    "rclioarka2.png"
  ], 
  siparisDetayi: [
    {Icon(Icons.bluetooth, size: 20.0): "Otomatik"},
    {Icon(Icons.airline_seat_individual_suite, size: 20.0): "5 Koltuk"},
    {Icon(Icons.pin_drop, size: 20.0): "1.5 DCI"},
    {Icon(Icons.shutter_speed, size: 20.0): "90 BG"},
    {Icon(Icons.invert_colors, size: 20.0): "Opak Beyaz"}
  ], 
  ozellikler: [
    {Icon(Icons.av_timer, size: 20.0): "Milegp(upto)"},
    {Icon(Icons.power, size: 20.0): "Motor Hacmi 1496cc"},
    {Icon(Icons.assignment_late, size: 20.0): "90 BG"},
    {Icon(Icons.account_balance_wallet, size: 20.0): "Bagaj Hacmi : 320 Lt"},
    {Icon(Icons.cached, size: 20.0): "Opak Beyaz"}
  ],
  sozlesme: [
    {Icon(Icons.bluetooth, size: 20.0): "Bluetooth"},
    {Icon(Icons.bluetooth, size: 20.0): "USB Port"},
    {Icon(Icons.bluetooth, size: 20.0): "Keyless"},
    {Icon(Icons.bluetooth, size: 20.0): "Android Auto"},
    {Icon(Icons.bluetooth, size: 20.0): "AC"}
  ],

  )
]);

class CarList {
  List<Car> arabalar;
  CarList({
    @required this.arabalar,
  });
}

class Car {
  String firmaAdi;
  String aracAdi;
  int fiyat;
  List<String> imgList;
  List<Map<Icon, String>> siparisDetayi;
  List<Map<Icon, String>> ozellikler;
  List<Map<Icon, String>> sozlesme;
  Car({
    @required this.firmaAdi,
    @required this.aracAdi,
    @required this.fiyat,
    @required this.imgList,
    @required this.siparisDetayi,
    @required this.ozellikler,
    @required this.sozlesme,
  });
}
