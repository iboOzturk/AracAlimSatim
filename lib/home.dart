

import 'package:deneme2/Utils/utils.dart';
import 'Services/motorapi.dart';
import 'Widgets/drawerWidget.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import '../../Services/auth_service.dart';
import 'Widgets/homebutton.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
   //getMotor();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange.shade900,),
      drawer: DrawerWidget(),


      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // FadeAnimation(1, Text("Giris", style: TextStyle(color: Colors.white, fontSize: 40),)),
                FadeAnimation(1, Image.asset('assets/images/ozturkcarLogo.png',height: 120,width: 250,)),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100), topRight: Radius.circular(100)
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 110,),
                    Wrap(spacing: 7,runSpacing: 40,alignment: WrapAlignment.center,
                      children: [

                        MenuButton(
                          gideceksayfa: 'arabatip', ikonrenk: Colors.green,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade800,
                          ikon: Icons.directions_car, metin: 'Araba Al', genislik: genislik*0.49,
                          bottomleft: 40,topright: 30,bottomright: 0,topleft: 0,
                        ),

                        MenuButton(
                          gideceksayfa: 'ikinciel', ikonrenk: Colors.red,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade700,
                          ikon: Icons.directions_car, metin: 'İkinci El Piyasası', genislik: genislik*0.49,
                          bottomleft: 0,topright: 0,bottomright: 40,topleft: 30,
                        ),
                        MenuButton(
                          gideceksayfa: 'carlist', ikonrenk: Colors.green,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade800,
                          ikon: Icons.monetization_on_outlined, metin: 'Fiyat Listesi', genislik: genislik*0.49,
                          bottomleft: 40,topright: 30,bottomright: 0,topleft: 0,
                        ),

                        MenuButton(
                          gideceksayfa: 'koleksiyon', ikonrenk: Colors.black,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade700,
                          ikon: LineIcons.car, metin: 'Koleksiyon Arabalar', genislik: genislik*0.49,
                          bottomleft: 0,topright: 0,bottomright: 40,topleft: 30,
                        ),

                        MenuButton(
                          gideceksayfa: 'motor', ikonrenk: Colors.black,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade700,
                          ikon: LineIcons.motorcycle, metin: 'Motorlar', genislik: genislik*0.49,
                          bottomleft: 40,topright: 30,bottomright: 0,topleft: 0,
                        ),

                        MenuButton(
                          gideceksayfa: 'hakkinda', ikonrenk: Colors.black,
                          ikonarkarenk: Colors.white, ButonRenk: Colors.orange.shade700,
                          ikon: Icons.person, metin: 'Hakkında', genislik: genislik*0.49,
                          bottomleft: 0,topright: 0,bottomright: 40,topleft: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

