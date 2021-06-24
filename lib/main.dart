import 'Ekranlar/Arabalarim/mycars.dart';
import '/Ekranlar/GirisIslem/sifresifirla.dart';
import '/Ekranlar/Grafik/Grafik.dart';
import '/Ekranlar/Motorsiklet/motorlar.dart';
import '/Ekranlar/Satma/ikinciel.dart';
import '/Ekranlar/Satma/satilikarabalar.dart';
import 'Ekranlar/GirisIslem/giris.dart';
import 'Ekranlar/GirisIslem/kayitol.dart';
import 'Ekranlar/ArabaDetay/arabadetay.dart';
import 'Ekranlar/KoleksiyonArabalar/koleksiyonarabalarpage.dart';
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
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange,accentColor: Colors.grey.shade900),
      initialRoute: '/',
      routes: {
         '/': (context) => SplashScreen(),
         '/mycars': (context) => MyCarsPage(),
         '/motor': (context) => MotorPage(),
         '/grafik': (context) => GrafikPage(),
         '/koleksiyon': (context) => KoleksiyonArabaPage(),
        '/giris': (context) => GirisPage(),
        '/kayit': (context) => KayitPage(),
        '/sifirla': (context) => SifirlaPage(),
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
        '/satilik': (context) => SatilikArabalar(),
        '/ikinciel': (context) => IkinciElPage(),
        '/buyed': (context) => BuyedPage(),
        '/arabadetay': (context) => ArabaDetay(),
      },
    );
  }
}

