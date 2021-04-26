import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
final RoundedRectangleBorder rrb =
    RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50)));
final TextStyle metinstil =GoogleFonts.righteous(fontSize: 30,fontWeight: FontWeight.w700);
    //TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold);

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
          //color: Colors.orange,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'OZTURK CAR',
                      style:GoogleFonts.orbitron(fontSize: 25,fontWeight: FontWeight.bold)
                         // TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    IconButton(icon: Icon(Icons.directions_car,size: 65,)),

                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Expanded(
                  child: Container(padding: EdgeInsets.only(right: 50),
                    alignment: Alignment.centerLeft,
                    decoration: ShapeDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey[600], Colors.grey[900]]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(285) ))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 70)),
                        // CarModels(),
                        FlatButton.icon(color: Colors.orange,
                            icon: Icon(Icons.car_rental,size: 40,),
                            shape: rrb,
                            padding: EdgeInsets.all(15),
                            onPressed: () {
                              Navigator.pushNamed(context, '/arabatip');
                            },
                            label: Text(
                              'Araç Satın Al',
                              style: metinstil,
                            )),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        FlatButton.icon(color: Colors.orange[600],
                            icon: Icon(Icons.monetization_on_outlined,size: 40,),
                            shape: rrb,
                            padding: EdgeInsets.all(15),
                            onPressed: () {
                              Navigator.pushNamed(context, '/sell');
                            },
                            label: Text(
                              'Araç Sat',
                              style: metinstil,
                            )),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        FlatButton.icon(color:Colors.orange[700],
                          icon: Icon(Icons.attach_money,size: 40,),
                          shape: rrb,
                          padding: EdgeInsets.all(15),
                          onPressed: () {
                            Navigator.pushNamed(context, '/carlist');
                          },
                          label: Text(
                            'Fiyat Listesi',
                            style: metinstil,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        FlatButton.icon(color:Colors.orange[700],
                          icon: Icon(Icons.person,size: 40,),
                          shape: rrb,
                          padding: EdgeInsets.all(15),
                          onPressed: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Deneme()));
                           Navigator.pushNamed(context, '/hakkinda');
                          },
                          label: Text(
                            'Hakkında',
                            style: metinstil,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
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
