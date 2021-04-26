import 'package:flutter/foundation.dart';

class CarItem {
  final String baslik;
  final double fiyat;
  final String yol;
  final String model;
  final String motorhacmi;
  final String yakit;
  final String marka;
  final String motorgucu;
  final String tip;

  CarItem(
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

CarsList allCars = CarsList(cars: [
  CarItem(
      baslik: 'Mercedes Benz AMG GT-R',
      fiyat: 3500000,
      model: 'AMG GT-R',
      motorhacmi: '3982cc',
      motorgucu: '585hp',
      yakit: 'Benzin',
      marka: 'Mercedes',
      tip: 'super',
      yol: 'assets/images/car8.png'),
  CarItem(
      baslik: 'Land Rover Evoque 2016',
      fiyat: 223000,
      model: 'Evoque',
      motorhacmi: '1853cc',
      motorgucu: '250hp',
      yakit: 'Benzin',
      marka: 'Land Rover',
      tip: 'suv',
      yol: 'assets/images/car2.png'),
  CarItem(
      baslik: 'Mercedes Benz CLS 2019',
      fiyat: 203000,
      model: 'CLS',
      motorhacmi: '2925cc',
      motorgucu: '340hp',
      yakit: 'Benzin',
      marka: 'Mercedes',
      tip: 'coupe',
      yol: 'assets/images/car3.png'),
  CarItem(
      baslik: 'Audi A6 2018',
      fiyat: 190000,
      model: 'A6',
      motorhacmi: '1968cc',
      motorgucu: '190hp',
      yakit: 'Benzin',
      marka: 'Audi',
      tip: 'sedan',
      yol: 'assets/images/car4.png'),
  CarItem(
      baslik: 'Jaguar E PACE',
      fiyat: 200000,
      model: 'E Pace',
      motorhacmi: '1998cc',
      motorgucu: '250hp',
      yakit: 'Benzin',
      marka: 'Jaguar',
      tip: 'suv',
      yol: 'assets/images/car5.png'),
  CarItem(
      baslik: 'BMW 730d Long',
      fiyat: 123000,
      model: '730d Long',
      motorhacmi: '2993cc',
      motorgucu: '245hp',
      yakit: 'Dizel',
      marka: 'BMW',
      tip: 'sedan',
      yol: 'assets/images/car6.png'),
  CarItem(
      baslik: 'BMW M2',
      fiyat: 350000,
      model: 'M2',
      motorhacmi: '2979cc',
      motorgucu: '410hp',
      yakit: 'Benzin',
      marka: 'BMW',
      tip: 'coupe',
      yol: 'assets/images/car7.png'),
  CarItem(
      baslik: 'Lamborghini Aventador',
      fiyat: 5500000,
      model: 'Aventador',
      motorhacmi: '6498cc',
      motorgucu: '700hp',
      yakit: 'Benzin',
      marka: 'Lamborghini',
      tip: 'super',
      yol: 'assets/images/car9.png'),
  CarItem(
      baslik: 'BMW X5',
      fiyat: 50000,
      model: 'X5',
      motorhacmi: '2933cc',
      motorgucu: '235hp',
      yakit: 'Dizel',
      marka: 'BMW',
      tip: 'suv',
      yol: 'assets/images/car1.png'),
  CarItem(
      baslik: 'Volkswagen Jetta',
      fiyat: 16000,
      model: 'Jetta',
      motorhacmi: '1395cc',
      motorgucu: '125hp',
      yakit: 'Dizel',
      marka: 'Volkswagen',
      tip: 'sedan',
      yol: 'assets/images/car12.png'),
  CarItem(
      baslik: 'Bugatti La Voiture Noire',
      fiyat: 18500000,
      model: 'La Voiture Noire',
      motorhacmi: '7938cc',
      motorgucu: '1500hp',
      yakit: 'Benzin',
      marka: 'Bugatti',
      tip: 'super',
      yol: 'assets/images/car11.png'),
  CarItem(
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
  List<CarItem> cars;

  CarsList({this.cars});
}