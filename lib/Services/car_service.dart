import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/carModel.dart';


class CarService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final carDetay=FirebaseFirestore.instance.collection('ArabaDetay');
  String isim='';
  String email='';
  String id='';
  int kontrol;
  int carUz;
  List<String> resimler;
  List<String> arabaModelleri;
  List<String> arabaMarkalari;
  List<String> arabaHacimleri;
  List<String> arabaGucleri;
  List<String> arabaYakitlari;
  List<String> arabaTipleri;
  List<String> arabaFiyatlari;
  List<String> arabaIDleri;
  int bmwC;
  int mercedesC;
  int audiC;
  int fordC;

  ///Grafik için marka sayaçı
  Future<int> markaSay() async{
    var bmwRef=await _firestore.collection('Arabalar').where('marka',isEqualTo: 'BMW').get();
    bmwC=bmwRef.size;
    print("bmw sayaç: "+bmwC.toString());
    var mercoRef=await _firestore.collection('Arabalar').where('marka',isEqualTo: 'Mercedes').get();
    mercedesC=mercoRef.size;
    //print("merco sayaç: "+bmwC.toString());
    var audiRef=await _firestore.collection('Arabalar').where('marka',isEqualTo: 'Audi').get();
    audiC=audiRef.size;
    //print("audi sayaç: "+audiC.toString());
    var fordRef=await _firestore.collection('Arabalar').where('marka',isEqualTo: 'Ford').get();
    fordC=fordRef.size;
    //print("ford sayaç: "+fordC.toString());

  }

  Future ArabalariAl() async{
    var isimref=await _firestore.collection('Kullanıcılar').doc(_auth.currentUser.uid).get();
    var isimK= isimref.data()['isim'];
    var emailK=isimref.data()['email'];
    var idK=isimref.id;
    print('isim: '+isimref.toString());
    isim=isimK;
    email=emailK;
    id=idK;
    var ref=await _firestore.collection('Kullanıcılar').doc(_auth.currentUser.uid).collection('Arabalar').get();
    carUz=ref.docs.length;
    var kontrolK=ref.size;
    kontrol=kontrolK;
    print('kontrol: '+kontrolK.toString());
    var liste=ref.docs.toList();
    arabaFiyatlari=List<String>();
    arabaMarkalari=List<String>();
    arabaModelleri=List<String>();
    arabaHacimleri=List<String>();
    arabaGucleri=List<String>();
    arabaYakitlari=List<String>();
    arabaTipleri=List<String>();
    arabaIDleri=List<String>();
    liste.forEach((element) {
     // print(element.data());
      arabaMarkalari.add(element.data()['marka']);
      arabaModelleri.add(element.data()['model']);
      arabaHacimleri.add(element.data()['motor hacmi']);
      arabaGucleri.add(element.data()['motor güç']);
      arabaYakitlari.add(element.data()['yakıt']);
      arabaTipleri.add(element.data()['tip']);
      arabaFiyatlari.add(element.data()['fiyat']);
      arabaIDleri.add(element.id);
    });

    resimler=new List<String>();
    for(int i=0;i<arabaMarkalari.length;i++)
    {
      Reference carYolRef = FirebaseStorage.instance.ref().child('cars/' + arabaMarkalari[i]+'.png');
      await carYolRef.getDownloadURL().then((value) {resimler.add(value);});
     // print('Resim url: '+resimler[i]);
    }
  }


  ///Arabalar Koleksiyonuna ekler
  ArabaEkle(String satanAdSoyad,String carMarka,
      String carModel,String carFiyat,String carMotorHacmi,
      String carMotorGuc,String carYakit,String carTip)
  async{
    CollectionReference collectionReference1=FirebaseFirestore.instance.collection('Arabalar');
    var documentRef=await collectionReference1.add(
        {'satan kişi':'$satanAdSoyad','marka': '$carMarka','model': '$carModel','fiyat': '$carFiyat','motor hacmi': '$carMotorHacmi',
          'motor güç':'$carMotorGuc','yakıt':'$carYakit','tip':'$carTip'});
    return CarDetay(id: documentRef.id,carModel: carModel,carMarka: carMarka,
        carFiyat: carFiyat,carMotorHacmi:carMotorHacmi,carMotorGuc: carMotorGuc,carYakit: carYakit,
        carTip: carTip
    );
  }
  ArabaEkle3(String carMarka,
      String carModel,String carFiyat,String carMotorHacmi,
      String carMotorGuc,String carYakit,String carTip)
  async{
    CollectionReference collectionReference1=FirebaseFirestore.instance.collection('Kullanıcılar').doc(_auth.currentUser.uid).collection('Arabalar');
    var documentRef=await collectionReference1.add(
        {'marka': '$carMarka','model': '$carModel','fiyat': '$carFiyat','motor hacmi': '$carMotorHacmi',
          'motor güç':'$carMotorGuc','yakıt':'$carYakit','tip':'$carTip'});
    return CarDetay(id: documentRef.id,carModel: carModel,carMarka: carMarka,
        carFiyat: carFiyat,carMotorHacmi:carMotorHacmi,carMotorGuc: carMotorGuc,carYakit: carYakit,
        carTip: carTip
    );
  }

  Stream<QuerySnapshot> getCarDetay() {
    var ref = _firestore.collection("Arabalar").snapshots();
    carDetay.get().then((value) {
      print(value.docs.length.toString());
      var r1=value.docs.length;
      return r1.toString();
    });
    return ref;
  }
  String getCarLogo(String marka){
    if(marka=='Mercedes'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FMercedes.png?alt=media&token=955268da-f949-4873-bc2a-144fc1ec4039';
    }
    else if(marka=='BMW'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FBMW.png?alt=media&token=c82c4dec-45bd-4cfb-9eca-d6b825f5e97d';
    }
    else if(marka=='Audi'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FAudi.png?alt=media&token=6143c86c-ac52-4afb-8955-4922af1a1510';
    }else if(marka=='Bugatti'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FBugatti.png?alt=media&token=28ec9428-9ca7-4bd3-bf80-01405b1d094d';
    }else if(marka=='Ford'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FFord.png?alt=media&token=2816c3fc-f21e-48c6-9218-7ca4a381e543';
    }else if(marka=='Lamborghini'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FLamborghini.png?alt=media&token=0a9ca73d-629d-4c20-852f-0d0e95560c37';
    }else if(marka=='Land Rover'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FLand%20Rover.png?alt=media&token=2513668e-bcc4-472e-81e3-34faa9855a4c';
    }else if(marka=='Volkswagen'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FVolkswagen.png?alt=media&token=a4d0b100-86ab-4c06-8f46-ee947fd07045';
    }else if(marka=='Renault') {
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FRenault.png?alt=media&token=a35b74e9-9101-4079-a575-742941d73a2a';
    }
    else if(marka=='Jaguar'){
      return 'https://firebasestorage.googleapis.com/v0/b/arabaalimsatim-9d678.appspot.com/o/cars%2FJaguar.png?alt=media&token=4f2b6c72-ffaa-4e05-8a2e-32dfd624a5bb';
    }
  }

  ///Kişiye araba ekler
  ArabaEkle2(String carMarka,String carModel,String carFiyat,String carMotorHacmi,String carMotorGuc,String carYakit,String carTip) async{
    CollectionReference collectionReference1=FirebaseFirestore.instance.collection('Kullanıcılar').doc(_auth.currentUser.uid).collection('Arabalar');
    var documentRef=await collectionReference1.add(
        {'marka': '$carMarka','model': '$carModel','fiyat': '$carFiyat','motor hacmi': '$carMotorHacmi',
          'motor güç':'$carMotorGuc','yakıt':'$carYakit','tip':'$carTip'});
    return CarDetay(id: documentRef.id,carModel: carModel,carMarka: carMarka,
        carFiyat: carFiyat,carMotorHacmi:carMotorHacmi,carMotorGuc: carMotorGuc,carYakit: carYakit,
        carTip: carTip
    );
  }

  ///araba silmek için
  Future<void> removeCar(String docId) {
    var ref = _firestore.collection("Arabalar").doc(docId).delete();
    return ref;
  }

  ///kişinin arabasını silmek için
  Future<void> removeMyCar(String userID,String docId) {
    var ref = _firestore.collection("Kullanıcılar").doc(userID).collection('Arabalar').doc(docId).delete();
    return ref;
  }
}