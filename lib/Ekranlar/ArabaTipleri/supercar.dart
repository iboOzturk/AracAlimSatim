import 'package:deneme2/Arabalar/coupecars.dart';
import 'file:///D:/AppData/uygulamar/deneme2/lib/Ekranlar/ArabaDetay/arabadetay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Arabalar/supercars.dart';
class SuperCar extends StatefulWidget {
  @override
  _SuperCarState createState() => _SuperCarState();
}

class _SuperCarState extends State<SuperCar> {
  String marka='';
  String model='';
  String fiyat='';
  String yakit='';
  String motorH='';
  String motorG='';
  String carimage='';
  String arabatip='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.grey[300],
      appBar: AppBar(centerTitle: true,shadowColor: Colors.lightGreenAccent[400],elevation: 5,
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: RadialGradient(
                colors: [Colors.green[300],Colors.green[700],Colors.green[600],Colors.green[400]],
                radius: 2,
                stops: [0.1,0.6,0.7,0.1]
            )
            )
        ),
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/arabatip');},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: Text('Super Car',style: GoogleFonts.newRocker(fontSize: 35,color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors:
        [Colors.lightGreenAccent[400],Colors.lightGreenAccent[200]])),
        child: ListView.builder(
          itemCount: superCars.supercars.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int i)=>Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: FlatButton(onPressed: (){
              var data=[];
              marka=superCars.supercars[i].marka;
              model=superCars.supercars[i].model;
              fiyat=superCars.supercars[i].fiyat.toString();
              yakit=superCars.supercars[i].yakit;
              motorH=superCars.supercars[i].motorhacmi;
              motorG=superCars.supercars[i].motorgucu;
              carimage=superCars.supercars[i].yol;
              arabatip=superCars.supercars[i].tip;
              data.add(marka);data.add(model);data.add(fiyat);data.add(yakit);data.add(motorH);data.add(motorG);
              data.add(carimage);data.add(arabatip);
              Navigator.pushNamed(context, '/arabadetay',arguments: data);
            },
              child: Card(shadowColor: Colors.green[800],
                elevation: 15,
                shape: CircleBorder(

                ),
                child: Container(
                  decoration: ShapeDecoration(gradient: LinearGradient(
                      colors: [Colors.green[900],Colors.green[400]],
                      begin: Alignment.centerRight,end: Alignment.centerLeft),
                      shape: CircleBorder(side: BorderSide(width: 2,color: Colors.green[400])
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: ShapeDecoration(//color: Colors.orange,
                        shape: CircleBorder()),
                    child: Column(textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        Image.asset(superCars.supercars[i].yol,),
                        Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            color: Colors.green[500],
                          ),
                          child: Column(
                            children:<Widget> [
                              Text(superCars.supercars[i].baslik,
                                style: GoogleFonts.newRocker(fontSize: 20,color: Colors.white),
                              ),
                              Text(superCars.supercars[i].fiyat.toString()+"\$",
                                style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
