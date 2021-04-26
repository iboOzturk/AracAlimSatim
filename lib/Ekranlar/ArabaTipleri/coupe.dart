import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Arabalar/coupecars.dart';
class Coupe extends StatefulWidget {
  @override
  _CoupeState createState() => _CoupeState();
}

class _CoupeState extends State<Coupe> {
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
      appBar: AppBar(centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient:LinearGradient(
              colors: [Colors.orange[600],Colors.red[900]],
              begin: Alignment.bottomLeft,end: Alignment.topRight) ),
        ),
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/arabatip');},icon: Icon(Icons.arrow_back_ios),),
        title: Text('Coupe',style: GoogleFonts.syncopate(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [Colors.orange[600],Colors.red[900]],
            begin: Alignment.bottomLeft,end: Alignment.topRight)),
        child: ListView.builder(
          itemCount: coupeCars.coupecars.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int i)=>Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: FlatButton(onPressed: (){
              var data=[];
              marka=coupeCars.coupecars[i].marka;
              model=coupeCars.coupecars[i].model;
              fiyat=coupeCars.coupecars[i].fiyat.toString();
              yakit=coupeCars.coupecars[i].yakit;
              motorH=coupeCars.coupecars[i].motorhacmi;
              motorG=coupeCars.coupecars[i].motorgucu;
              carimage=coupeCars.coupecars[i].yol;
              arabatip=coupeCars.coupecars[i].tip;
              data.add(marka);data.add(model);data.add(fiyat);data.add(yakit);data.add(motorH);data.add(motorG);
              data.add(carimage);data.add(arabatip);
              Navigator.pushNamed(context, '/arabadetay',arguments: data);
            },
              child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                child: Container(
                  decoration: ShapeDecoration(gradient: LinearGradient(
                      colors: [Colors.orange[200],Colors.red[300],Colors.orange[300],Colors.red[200]]
                  ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
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
                        Image.asset(coupeCars.coupecars[i].yol,),
                        Text(coupeCars.coupecars[i].baslik,textAlign: TextAlign.center,style: GoogleFonts.syncopate(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(coupeCars.coupecars[i].fiyat.toString()+"\$",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
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
