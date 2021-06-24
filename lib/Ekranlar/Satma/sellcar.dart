import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Services/auth_service.dart';
import '../../Services/car_service.dart';
class SellCar extends StatefulWidget {
  SellCar() : super();

  @override
  SellCarState createState() => SellCarState();
}


class SellCarState extends State<SellCar> {

  AuthService _authService = AuthService();
  CarService _service = CarService();
  String ad='';
  String soyad='';
  String tel='';

  final _markalar=["Mercedes","BMW","Audi","Ford","Renault"];
  String _marka=null;

  TextEditingController markactr=TextEditingController();
  TextEditingController modelctr=TextEditingController();
  TextEditingController fiyatctr=TextEditingController();
  TextEditingController hacmictr=TextEditingController();
  TextEditingController gucctr=TextEditingController();
  TextEditingController yakitctr=TextEditingController();
  TextEditingController tipctr=TextEditingController();
  TextEditingController adsoyadctr=TextEditingController();
  void temizle(){
    adsoyadctr.text='';
    markactr.text='';
    modelctr.text='';
    fiyatctr.text='';
    hacmictr.text='';
    gucctr.text='';
    yakitctr.text='';
    tipctr.text='';
  }


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
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
    void _TelKaydet(String text){
      setState(() {
        tel=text;
      });
    }
    void sat(){
      if(ad.length>=3&&soyad.length>=3&&tel.length==10){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(padding: EdgeInsets.all(10),
              backgroundColor: Colors.green[500],
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25) ),
              content: Text('Sayın $ad $soyad\n'
                  'Aracınızın satılık ilanı verilmiştir'
                  ,style: TextStyle(fontSize: 20,color: Colors.black),),
              action: SnackBarAction(
                textColor: Colors.black,
                label: 'Geri Dön',
                onPressed: (){Navigator.pushNamed(context, '/home');},
              ),
            ));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lütfen Bilgileri Doldurunuz!!'),
              backgroundColor: Colors.red[300],
            ));
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(alignment: Alignment.topCenter,height: MediaQuery.of(context).size.height,
                  decoration: ShapeDecoration(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50) ,
                              bottomRight:Radius.circular(50)
                  ))),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pushNamed(context, '/home');
                          },icon: Icon(Icons.arrow_back_ios),),
                          Text('Bilgileri doldurunuz',style: TextStyle(fontSize: 25),),
                          Padding(padding: EdgeInsets.only(right: 25))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(
                          controller: adsoyadctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "İsim ve Soyismi Doldur";
                            }
                          },
                          //onChanged: (text){_adKaydet(text);},
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Adınızı Soyadınızı giriniz: '),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Marka: ',style: TextStyle(fontSize: 16),),
                          SizedBox(width: 5,),
                          Container(
                            color: Colors.grey[400],
                            padding: EdgeInsets.only(left: 80, right: 50
                            ),
                            child: DropdownButton<String>(
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 35,
                              dropdownColor: Colors.orange,
                              value: _marka,
                              items: _markalar.map((String value) {
                                return DropdownMenuItem(
                                    value: value,
                                    child: Text(value));
                              }).toList(),
                              onChanged: (String value){
                                updateSelect(value);
                                _marka=value;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                    /*  Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(
                          controller: markactr,
                          onChanged: (text){_SoyadKaydet(text);},
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Marka giriniz: '),
                        ),
                      ), */
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                          controller: modelctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Modeli Doldur";
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Model giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                          controller: hacmictr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Motor Hacmini Doldur";
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Motor Hacmi giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                          controller: fiyatctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Fiyatı Doldur";
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Fiyat giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                          controller: gucctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Motor gücünü Doldur";
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Motor Gücü giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(
                          controller: yakitctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Yakıt türünü Doldur";
                            }
                          },
                         // keyboardType: TextInputType.number,
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        //  onChanged: (text){_TelKaydet(text);},
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Yakıt türü giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(//onChanged: (text){_SoyadKaydet(text);},
                          controller: tipctr,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Arabanın tipini Doldur";
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Tipini giriniz: '),
                        ),
                      ),
                      SizedBox(height: 5,),

                      SizedBox(height: 20.0,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                              primary: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                          ),
                          onPressed: () {
                            if(adsoyadctr.text!=null&&
                                modelctr.text!=null&&hacmictr.text!=null&&
                                fiyatctr.text!=null&&gucctr.text!=null&&
                                yakitctr.text!=null&&tipctr.text!=null)
                            {
                              _service.ArabaEkle(adsoyadctr.text,_marka, modelctr.text, fiyatctr.text,hacmictr.text,gucctr.text,yakitctr.text,tipctr.text);
                              temizle();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('alanları doldur')));
                            }

                            //sat();
                          },
                          child: Text('Sat', style: TextStyle(fontSize: 25),)
                      ),
                    ],
                  ),
                ), /*
                SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                        primary: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                    ),
                    onPressed: () {
                      sat();
                    },
                    child: Text('Sat', style: TextStyle(fontSize: 25),)
                ),
                SizedBox(height: 20.0,), */
              ],
            ),
          ),
        ),
      ),
    );
  }
  void updateSelect(String value) {
    String marka;
    switch (value) {
      case "Mercedes":
        marka='Mercedes';
        break;
      case "BMW":
        marka='BMW';
        break;
      case "Audi":
        marka='Audi';
        break;
      default:
    }
    print(marka);
    setState(() {
      _marka=marka;
    });
  }
}
