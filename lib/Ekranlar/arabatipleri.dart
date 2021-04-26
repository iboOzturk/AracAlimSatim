import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'carstyle.dart';
import '../Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArabaTipleri extends StatefulWidget {
  @override
  _ArabaTipleriState createState() => _ArabaTipleriState();
}

class _ArabaTipleriState extends State<ArabaTipleri> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])),
          //color: Colors.orange,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    }),
                    Text('Araba Tipleri',style: GoogleFonts.josefinSans(fontSize: 30,fontWeight: FontWeight.w800),),
                    Padding(padding: EdgeInsets.only(right: 20))
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          gradient: LinearGradient(colors: [Colors.amber[600],Colors.amber[900]]),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),topRight: Radius.circular(45)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart_rounded),
                              Text('- Katalog:',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          CarStyle(),
                          Padding(padding: EdgeInsets.only(top: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
