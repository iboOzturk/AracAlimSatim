import 'package:cloud_firestore/cloud_firestore.dart';

class CarDetay {
  final String id;
  final String carModel;
  final String carMarka;
  final String carFiyat;
  final String carMotorHacmi;
  final String carMotorGuc;
  final String carYakit;
  final String carTip;


  CarDetay({this.id,
    this.carModel,
    this.carMarka,
    this.carFiyat,
    this.carMotorHacmi,
    this.carMotorGuc,
    this.carYakit,
    this.carTip
  });

  factory CarDetay.fromSnapshot(DocumentSnapshot snapshot) {
    return CarDetay(
      id: snapshot.id,
      carModel: snapshot["model"],
      carMarka: snapshot["marka"],
      carFiyat: snapshot["fiyat"],
      carMotorHacmi: snapshot["motor hacmi"],
      carMotorGuc: snapshot["motor güç"],
      carYakit: snapshot["yakıt"],
      carTip: snapshot["tip"],
    );
  }
}