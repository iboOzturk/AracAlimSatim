import 'dart:convert';
import 'package:http/http.dart' as http;


String url='http://motor.bulutbyte.net/api/';

class Motor {
  int MotorID;
  String MotorMarka;
  String MotorModel;
  int Fiyat;

  Motor(this.MotorID, this.MotorMarka, this.MotorModel, this.Fiyat,);

}

Future<List<Motor>> getMotor() async{
  var data =await http.get(Uri.parse(url+'MotorGetir'));
  var jsonData=json.decode(data.body);
  List<Motor> motorlar=[];
  for(var u in jsonData){
    Motor motor=Motor(u['MotorID'],u['MotorMarka'],u['MotorModel'],u['Fiyat'],

    );
    motorlar.add(motor);
    print(u['MotorMarka']);
  }
  print("oyuncu sayısı: "+motorlar.length.toString());
  return motorlar;
}

Future motorGuncelle(int motorid,int fiyat)async{
  //http://motor.bulutbyte.net/api/MotorGuncelle?motorid=7&fiyat=21
  var data =await http.post(Uri.parse(url+'MotorGuncelle?motorid=$motorid&fiyat=$fiyat'));

  //return data;
}


