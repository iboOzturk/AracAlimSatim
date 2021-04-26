import 'package:flutter/foundation.dart';

class SedanCarItem {
  final String baslik;
  final double fiyat;
  final String yol;
  final String model;
  final String motorhacmi;
  final String yakit;
  final String marka;
  final String motorgucu;
  final String tip;

  SedanCarItem(
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

CarsList sedanCars = CarsList(sedancars: [
  SedanCarItem(
      baslik: 'Audi A6 2018',
      fiyat: 190000,
      model: 'A6',
      motorhacmi: '1968cc',
      motorgucu: '190hp',
      yakit: 'Benzin',
      marka: 'Audi',
      tip: 'sedan',
      yol: 'assets/images/car4.png'),
  SedanCarItem(
      baslik: 'BMW 730d Long',
      fiyat: 123000,
      model: '730d Long',
      motorhacmi: '2993cc',
      motorgucu: '245hp',
      yakit: 'Dizel',
      marka: 'BMW',
      tip: 'sedan',
      yol: 'assets/images/car6.png'),
  SedanCarItem(
      baslik: 'Volkswagen Jetta',
      fiyat: 16000,
      model: 'Jetta',
      motorhacmi: '1395cc',
      motorgucu: '125hp',
      yakit: 'Dizel',
      marka: 'Volkswagen',
      tip: 'sedan',
      yol: 'assets/images/car12.png'),
]);

class CarsList {
  List<SedanCarItem> sedancars;

  CarsList({this.sedancars});
}