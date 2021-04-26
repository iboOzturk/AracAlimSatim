import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  String ad='';
  String soyad='';
  String sifre='123';
  String sifrek='';
  String markamodel='';
  String carImage='';
  void gonder(){
    var data1=[];
    data1.add(ad);
    data1.add(soyad);
    data1.add(markamodel);
    data1.add(carImage);
    Navigator.pushNamed(context, '/buyed',arguments: data1);
  }
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    markamodel=data[0].toString()+' '+data[1].toString();
    carImage=data[3].toString();
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
    void _SifreKaydet(String text){
      setState(() {
        sifrek=text;
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
      else if (sifrek!=sifre){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Şifre Yanlış'),
              backgroundColor: Colors.red[300],
            ));
      }
      else
      {
        gonder();
      }
    }
    void sifrebilgi(){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(padding: EdgeInsets.only(left: 20,right: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            content: Text('Şifre 41*3\' sonucudur',style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.orange,
          ));
    }
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
          actions: [IconButton(icon: Icon(Icons.info), onPressed: (){sifrebilgi();})],
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
                    labelText: 'Adınızı giriniz: '
                  ),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25,right: 25),
                  child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                    decoration: InputDecoration(
                    labelText: 'Soyadınızı giriniz: '
                  ),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25,right: 25),
                  child: TextFormField(onChanged: (text){_SifreKaydet(text);},
                    obscureText: true,
                    decoration: InputDecoration(
                    labelText: 'Şifrenizi giriniz: '
                  ),),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[500]),
                    onPressed: (){satinal();},
                    child: Text('Satın AL',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
