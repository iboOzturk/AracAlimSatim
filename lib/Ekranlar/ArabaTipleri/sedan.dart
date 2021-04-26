import 'package:deneme2/Arabalar/coupecars.dart';
import 'file:///D:/AppData/uygulamar/deneme2/lib/Ekranlar/ArabaDetay/arabadetay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Arabalar/sedancars.dart';
class Sedan extends StatefulWidget {
  @override
  _SedanState createState() => _SedanState();
}

class _SedanState extends State<Sedan> {
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
      appBar: AppBar(centerTitle: true,shadowColor: Colors.white,elevation: 2,
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                colors: [Colors.blue[900],Colors.blue[400]],stops: [0.8,0.5]
            )
            )
        ),
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/arabatip');},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: Text('Sedan',style: GoogleFonts.jura(fontSize: 35,color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue[900],Colors.blue[400]])),
        child: ListView.builder(
          itemCount: sedanCars.sedancars.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int i)=>Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: FlatButton(onPressed: (){
              var data=[];
              marka=sedanCars.sedancars[i].marka;
              model=sedanCars.sedancars[i].model;
              fiyat=sedanCars.sedancars[i].fiyat.toString();
              yakit=sedanCars.sedancars[i].yakit;
              motorH=sedanCars.sedancars[i].motorhacmi;
              motorG=sedanCars.sedancars[i].motorgucu;
              carimage=sedanCars.sedancars[i].yol;
              arabatip=sedanCars.sedancars[i].tip;
              data.add(marka);data.add(model);data.add(fiyat);data.add(yakit);data.add(motorH);data.add(motorG);
              data.add(carimage);data.add(arabatip);
              Navigator.pushNamed(context, '/arabadetay',arguments: data);
            },
              child: Card(shadowColor: Colors.orange[800],
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(50),topRight: Radius.circular(50) )
                ),
                child: Container(
                  decoration: ShapeDecoration(gradient: LinearGradient(
                      colors: [Colors.blue[900],Colors.blue[400]],begin: Alignment.centerRight,end: Alignment.centerLeft),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          bottomRight:Radius.circular(50),topRight: Radius.circular(50) )
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                    child: Column(textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(sedanCars.sedancars[i].yol,),
                        Text(sedanCars.sedancars[i].baslik,
                          style: GoogleFonts.jura(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700),),
                        Text(sedanCars.sedancars[i].fiyat.toString()+"\$",
                          style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
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
