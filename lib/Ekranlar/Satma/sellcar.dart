import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellCar extends StatefulWidget {
  SellCar() : super();

  @override
  SellCarState createState() => SellCarState();
}
class Car {
  int id;
  String name;

  Car(this.id, this.name);

  static List<Car> getCompanies() {
    return <Car>[
      Car(1, 'Mercedes SLS 2019'),
      Car(2, 'BMW M2'),
      Car(3, 'Audi A6'),
      Car(4, 'Land Rover Evoque'),
      Car(5, 'Lamborgohini Gallardo'),
    ];
  }
}

class SellCarState extends State<SellCar> {
  String ad='';
  String soyad='';
  String tel='';
  List<Car> _cars = Car.getCompanies();
  List<DropdownMenuItem<Car>> _dropdownMenuItems;
  Car _selectedCar;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_cars);
    _selectedCar = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Car>> buildDropdownMenuItems(List cars) {
    List<DropdownMenuItem<Car>> items = List();
    for (Car car in cars) {
      items.add(
        DropdownMenuItem(
          value: car,
          child: Text(car.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Car selectedCar) {
    setState(() {
      _selectedCar = selectedCar;
    });
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
                Container(alignment: Alignment.topCenter,height: 365,
                  decoration: ShapeDecoration(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25) ,
                              bottomRight:Radius.circular(25)
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
                          onChanged: (text){_adKaydet(text);},
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Adınızı giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(onChanged: (text){_SoyadKaydet(text);},
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Soyadınızı giriniz: '),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (text){_TelKaydet(text);},
                          maxLength: 10,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Telefonunuzu giriniz: '),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        color: Colors.grey[400],
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: DropdownButton(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 35,
                          dropdownColor: Colors.orange,
                          value: _selectedCar,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text('Selected: ${_selectedCar.name}',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 20.0,),
                    ],
                  ),
                ),
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
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
