import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarStyle extends StatefulWidget {
  @override
  _CarStyleState createState() => _CarStyleState();
}

class _CarStyleState extends State<CarStyle> {
  final ShapeDecoration dek = ShapeDecoration(
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/coupe');
          },
          child: Container(
            decoration: dek,
            width: 350,
            height: 205,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/car3.png',
                  height: 150,
                  width: 280,
                ),
                Text(
                  'Coupe',
                  style: GoogleFonts.syncopate(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/suv');
          },
          child: Container(
            decoration: dek,
            width: 350,
            height: 205,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/car2.png',
                  height: 150,
                  width: 280,
                ),
                Text(
                  'SUV',
                  style: GoogleFonts.audiowide(fontSize: 25),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sedan');
          },
          child: Container(
            decoration: dek,
            width: 350, height: 205,
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/car6.png', height: 150, width: 280,),
                Text('Sedan', style: GoogleFonts.jura(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/super');
          },
          child: Container(
            decoration: dek, width: 350, height: 205,
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/car8.png', height: 150, width: 280,),
                Text('Supercar', style: GoogleFonts.newRocker(fontSize: 25),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
      ]),
    );
  }
}
