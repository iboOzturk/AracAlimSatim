import 'dart:async';

import 'package:deneme2/Ekranlar/GirisIslem/giris.dart';

import 'package:deneme2/home.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushNamed(context, '/giris');
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('assets/images/ozturkcarLogo.png',height: 350,width: 350,),
      ),
    );
  }
}
