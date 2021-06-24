import 'package:flutter/material.dart';
import 'magazadanKoleksiyon.dart';
import 'sahibindenKoleksiyon.dart';
import 'ekleKoleksiyon.dart';
import '/Services/db_helper.dart';
import '../../Model/koleksiyonCarModel.dart';
import 'package:url_launcher/url_launcher.dart';

class KoleksiyonArabaPage extends StatefulWidget {
  @override
  _KoleksiyonArabaPageState createState() => _KoleksiyonArabaPageState();
}

class _KoleksiyonArabaPageState extends State<KoleksiyonArabaPage> {
  int _selectedIndex=0;
  List<Widget> _widgetOptions=<Widget>[
    MagazadanPage(),
    SahibindenPage(),
    AddCollecCarPage(koleksiyoncar: KoleksiyonCar())
  ];
  void _onItemTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 111, 0),
        elevation: 10,shadowColor: Colors.black,
        title: Text('Koleksiyon Arabalar'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body:  _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        iconSize: 25,selectedFontSize: 17,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

              icon: Icon(Icons.shopping_cart,color: Colors.white,),
              title: Text('Mağazadan',style: TextStyle(color: Colors.white),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.white,),
              title: Text('Sahibinden',style: TextStyle(color: Colors.white),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.white,),
              title: Text('Ekle',style: TextStyle(color: Colors.white),)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
