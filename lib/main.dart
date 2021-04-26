import 'Ekranlar/ArabaDetay/arabadetay.dart';
import 'Ekranlar/arabatipleri.dart';
import 'Ekranlar/SatinAlma/buypage.dart';
import 'Ekranlar/ArabaTipleri/coupe.dart';
import 'Ekranlar/carlist.dart';
import 'home.dart';
import 'Ekranlar/ArabaTipleri/sedan.dart';
import 'Ekranlar/Satma/sellcar.dart';
import 'Ekranlar/splashScreen.dart';
import 'Ekranlar/ArabaTipleri/supercar.dart';
import 'Ekranlar/ArabaTipleri/suv.dart';
import 'package:flutter/material.dart';
import 'Ekranlar/SatinAlma/buyedPage.dart';
import 'Ekranlar/hakkinda.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey,accentColor: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => homePage(),
        '/coupe': (context) => Coupe(),
        '/suv': (context) => Suv(),
        '/sedan': (context) => Sedan(),
        '/super': (context) => SuperCar(),
        '/arabatip': (context) => ArabaTipleri(),
        '/hakkinda': (context) => Hakkinda(),
        '/carlist': (context) => CarList(),
        '/buy': (context) => BuyPage(),
        '/sell': (context) => SellCar(),
        '/buyed': (context) => BuyedPage(),
        '/arabadetay': (context) => ArabaDetay(),
      },
    );
  }
}

