import 'package:deneme2/Services/file_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Services/car_service.dart';

class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  String ad='';
  String soyad='';
  String adsoyad='';
  String markamodel='';
  String marka='';
  String model='';
  String fiyat='';
  String yakit='';
  String motorHacmi='';
  String motorGucu='';
  String tip='';
  String carImage='';
  String data1;
  CarService _statusService=CarService();
  void gonder(){
    var data1=[];
    data1.add(ad);
    data1.add(soyad);
    data1.add(markamodel);
    data1.add(carImage);
    data1.add(marka);
    data1.add(model);
    data1.add(fiyat);
    data1.add(yakit);
    data1.add(motorGucu);
    data1.add(motorHacmi);
    data1.add(tip);
    Navigator.pushNamed(context, '/buyed',arguments: data1);
  }
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    markamodel=data[0].toString()+' '+data[1].toString();
    carImage=data[3].toString();
    marka=data[0].toString();
    model=data[1].toString();
    fiyat=data[2].toString();
    yakit=data[4].toString();
    motorHacmi=data[5].toString();
    motorGucu=data[6].toString();
    tip=data[7].toString();
    adsoyad=ad+' '+soyad;
    void _adKaydet(String text){
      setState(() {
        ad=text;
      });
    }
    void _SoyadKaydet(String text){
      setState(() {
        soyad=text;
      });
    }
    void satinal(){
      if(ad.length<3||soyad.length<3){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lütfen Bilgileri Doldurunuz!!'),
              backgroundColor: Colors.red[300],
            ));
      }
      else
      {
        gonder();
      }
    }
    data1=adsoyad.toUpperCase()+" \n"+marka+" "+model+"\n"+fiyat+'\$ a Satın alındı';
    return Scaffold(backgroundColor: Colors.grey[300],
      appBar: PreferredSize(  preferredSize: Size.fromHeight(210),
        child: AppBar(
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(25) ,bottomLeft:Radius.circular(25) ),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[600],
                image: DecorationImage(image: AssetImage(carImage.toString()),
                  fit: BoxFit.contain,colorFilter: ColorFilter.mode(Colors.grey[600], BlendMode.screen)
                ),
              ),
              child: Column( mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Satın Alınacak Araç:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text(data[0].toString()+' '+data[1].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Fiyat: '+data[2].toString()+'\$',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(25) ,bottomLeft:Radius.circular(25) ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Padding(padding: EdgeInsets.only(top: 20)),

                Container(
                  padding: EdgeInsets.only(left: 25,right: 25),
                  child: TextFormField(onChanged: (text){_adKaydet(text);},
                    decoration: InputDecoration(
                    labelText: 'Adınızı giriniz: ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 25,right: 25),
                  child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                    decoration: InputDecoration(
                    labelText: 'Soyadınızı giriniz: ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))
                  ),),

                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[500]),
                    onPressed: (){
                      fileUtils.saveToFile(data1.toString());
                      _statusService.ArabaEkle3(marka, model, fiyat, motorHacmi, motorGucu, yakit, tip);
                      satinal();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>SatinAlindi()));
                    },
                    child: Text('Satın AL',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
