import 'package:flutter/foundation.dart';

class SuperCarItem {
  final String baslik;
  final double fiyat;
  final String yol;
  final String model;
  final String motorhacmi;
  final String yakit;
  final String marka;
  final String motorgucu;
  final String tip;

  SuperCarItem(
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

CarsList superCars = CarsList(supercars: [
  SuperCarItem(
      baslik: 'Mercedes Benz AMG GT-R',
      fiyat: 3500000,
      model: 'AMG GT-R',
      motorhacmi: '3982cc',
      motorgucu: '585hp',
      yakit: 'Benzin',
      marka: 'Mercedes',
      tip: 'super',
      yol: 'assets/images/car8.png'),
  SuperCarItem(
      baslik: 'Lamborghini Aventador',
      fiyat: 5500000,
      model: 'Aventador',
      motorhacmi: '6498cc',
      motorgucu: '700hp',
      yakit: 'Benzin',
      marka: 'Lamborghini',
      tip: 'super',
      yol: 'assets/images/car9.png'),
  SuperCarItem(
      baslik: 'Bugatti La Voiture Noire',
      fiyat: 18500000,
      model: 'La Voiture Noire',
      motorhacmi: '7938cc',
      motorgucu: '1500hp',
      yakit: 'Benzin',
      marka: 'Bugatti',
      tip: 'super',
      yol: 'assets/images/car11.png'),
]);

class CarsList {
  List<SuperCarItem> supercars;

  CarsList({this.supercars});
}