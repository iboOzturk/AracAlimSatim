import 'package:flutter/foundation.dart';

class SuvCarItem {
  final String baslik;
  final double fiyat;
  final String yol;
  final String model;
  final String motorhacmi;
  final String yakit;
  final String marka;
  final String motorgucu;
  final String tip;

  SuvCarItem(
      {@required this.baslik,
        @required this.fiyat,
        @required this.yol,
        @required this.model,
        @required this.motorhacmi,
        @required this.yakit,
        @required this.marka,
        @required this.motorgucu,
        @required this.tip,
      });
}

CarsList sedanCars = CarsList(suvcars: [
  SuvCarItem(
      baslik: 'Land Rover Evoque 2016',
      fiyat: 223000,
      model: 'Evoque',
      motorhacmi: '1853cc',
      motorgucu: '250hp',
      yakit: 'Benzin',
      marka: 'Land Rover',
      tip: 'suv',
      yol: 'assets/images/car2.png'),
  SuvCarItem(
      baslik: 'Jaguar E PACE',
      fiyat: 200000,
      model: 'E Pace',
      motorhacmi: '1998cc',
      motorgucu: '250hp',
      yakit: 'Benzin',
      marka: 'Jaguar',
      tip: 'suv',
      yol: 'assets/images/car5.png'),
  SuvCarItem(
      baslik: 'BMW X5',
      fiyat: 50000,
      model: 'X5',
      motorhacmi: '2933cc',
      motorgucu: '235hp',
      yakit: 'Dizel',
      marka: 'BMW',
      tip: 'suv',
      yol: 'assets/images/car1.png'),
]);

class CarsList {
  List<SuvCarItem> suvcars;

  CarsList({this.suvcars});
}