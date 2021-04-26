import 'package:flutter/foundation.dart';

class CoupeCarItem {
  final String baslik;
  final double fiyat;
  final String yol;
  final String model;
  final String motorhacmi;
  final String yakit;
  final String marka;
  final String motorgucu;
  final String tip;

  CoupeCarItem(
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

CarsList coupeCars = CarsList(coupecars: [
  CoupeCarItem(
      baslik: 'Mercedes Benz CLS 2019',
      fiyat: 203000,
      model: 'CLS',
      motorhacmi: '2925cc',
      motorgucu: '340hp',
      yakit: 'Benzin',
      marka: 'Mercedes',
      tip: 'coupe',
      yol: 'assets/images/car3.png'),
  CoupeCarItem(
      baslik: 'BMW M2',
      fiyat: 350000,
      model: 'M2',
      motorhacmi: '2979cc',
      motorgucu: '410hp',
      yakit: 'Benzin',
      marka: 'BMW',
      tip: 'coupe',
      yol: 'assets/images/car7.png'),
  CoupeCarItem(
      baslik: 'Audi A5',
      fiyat: 116000,
      model: 'A5',
      motorhacmi: '1968cc',
      motorgucu: '190hp',
      yakit: 'Benzin',
      marka: 'Audi',
      tip: 'coupe',
      yol: 'assets/images/car10.png'),
]);

class CarsList {
  List<CoupeCarItem> coupecars;

  CarsList({this.coupecars});
}