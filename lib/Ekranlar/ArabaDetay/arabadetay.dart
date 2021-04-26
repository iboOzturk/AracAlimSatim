import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/utils.dart';
class ArabaDetay extends StatefulWidget {
  @override
  _ArabaDetayState createState() => _ArabaDetayState();
}

class _ArabaDetayState extends State<ArabaDetay> {

  String marka='';
  String model='';
  String fiyat='';
  String yakit='';
  String motorH='';
  String motorG='';
  String carimage='';
  String arabatip='';
  final TextStyle metinstil=TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white);
  final ShapeDecoration kutu=ShapeDecoration(
      gradient: LinearGradient(
          colors: [Colors.grey[600],Colors.grey[200],Colors.grey[600],Colors.grey[900]],
          begin: Alignment.bottomLeft,end: Alignment.topRight
      ),
      shape: RoundedRectangleBorder()
  );
  @override
  Widget build(BuildContext context) {
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    marka=data[0].toString();
    model=data[1].toString();
    fiyat=data[2].toString();
    yakit=data[3].toString();
    motorH=data[4].toString();
    motorG=data[5].toString();
    carimage=data[6].toString();
    arabatip=data[7].toString();
    void don(){
      if(arabatip=='coupe'){Navigator.pushNamed(context, '/coupe');}
      else if(arabatip=='suv'){Navigator.pushNamed(context, '/suv');}
      else if(arabatip=='sedan'){Navigator.pushNamed(context, '/sedan');}
      else if(arabatip=='super'){Navigator.pushNamed(context, '/super');}
    }
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: (){don();},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),) ,
        title: Text('Araç Özellikleri',style: GoogleFonts.tradeWinds(
          color: Colors.white,fontSize: 25,
        ),),
      ),
      body: Container(decoration: kutu,padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            SizedBox(height: 10,),
            Image.asset(carimage),
            Container(alignment: Alignment.center,
              decoration: ShapeDecoration(color: Colors.grey[700],
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )),
              //color: Colors.grey[700],
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Marka: '+marka+'\n'
                      'Model: '+model+'\n'
                      'Fiyat: '+fiyat+'\n'
                      'Yakıt: '+yakit+'\n'
                      'Motor Hacmi: '+motorH+'\n'
                      'Motor Gücü: '+motorG,style: GoogleFonts.fondamento(
                    color: Colors.white,fontSize: 25
                  ),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 70)),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.orange),onPressed: (){
              var data=[];
              data.add(marka);
              data.add(model);
              data.add(fiyat);
              data.add(carimage);
              Navigator.pushNamed(context, '/buy',arguments: data);},
                child: Text('Satın al',style: metinstil,))
          ],
        ),
      ),
    );
  }
}
