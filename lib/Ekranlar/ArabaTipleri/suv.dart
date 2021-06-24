import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Arabalar/suvcars.dart';
class Suv extends StatefulWidget {
  @override
  _SuvState createState() => _SuvState();
}

class _SuvState extends State<Suv> {
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
      appBar: AppBar(centerTitle: true,shadowColor: Colors.orange[800],elevation: 5,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient:LinearGradient(
              colors: [Colors.grey[200],Colors.orange,Colors.orange,Colors.grey[700]],stops:[0.3,0.2,0.7,0.3] ,
              begin: Alignment.bottomLeft,end: Alignment.topRight) ),
        ),
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/arabatip');},icon: Icon(Icons.arrow_back_ios),),
        title: Text('SUV',style: GoogleFonts.audiowide(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [Colors.grey[100],Colors.grey[800]],
            begin: Alignment.bottomLeft,end: Alignment.topRight)),
        child: ListView.builder(
          itemCount: sedanCars.suvcars.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int i)=>Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: FlatButton(onPressed: (){
              var data=[];
              marka=sedanCars.suvcars[i].marka;
              model=sedanCars.suvcars[i].model;
              fiyat=sedanCars.suvcars[i].fiyat.toString();
              yakit=sedanCars.suvcars[i].yakit;
              motorH=sedanCars.suvcars[i].motorhacmi;
              motorG=sedanCars.suvcars[i].motorgucu;
              carimage=sedanCars.suvcars[i].yol;
              arabatip=sedanCars.suvcars[i].tip;
              data.add(marka);data.add(model);data.add(fiyat);data.add(yakit);data.add(motorH);data.add(motorG);
              data.add(carimage);data.add(arabatip);
              Navigator.pushNamed(context, '/arabadetay',arguments: data);
            },
              child: Card(shadowColor: Colors.orange[800],
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(100) ,bottomRight:Radius.circular(50),topLeft: Radius.circular(50),topRight: Radius.circular(15) )
                ),
                child: Container(
                  decoration: ShapeDecoration(gradient: LinearGradient(
                      colors: [Colors.orange[300],Colors.orange[200],Colors.orange[400],Colors.orange[300]]
                    // colors: [Colors.red[200],Colors.blue[900]]
                  ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          bottomLeft:Radius.circular(100) ,bottomRight:Radius.circular(50),topLeft: Radius.circular(50),topRight: Radius.circular(15) )
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
                        Image.asset(sedanCars.suvcars[i].yol,),
                        Text(sedanCars.suvcars[i].baslik,textAlign:TextAlign.center,
                          style: GoogleFonts.audiowide(fontSize: 20),),
                        Text(sedanCars.suvcars[i].fiyat.toString()+"\$",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
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
